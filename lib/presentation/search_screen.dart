import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weabo_app/bloc/search_anime/search_anime_bloc.dart';
import 'package:flutter_weabo_app/model/anime_model.dart';
import 'package:flutter_weabo_app/shared/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weabo_app/widget/anime_item.dart';

import '../shared/status_enum.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _onSearch() {
      if (searchController.text.isEmpty || searchController.text.length < 3) {
        AnimatedSnackBar.material(
          "Keyword tidak boleh kosong atau kurang dari 3 karakter",
          type: AnimatedSnackBarType.error,
        ).show(context);
      } else {
        context
            .read<SearchAnimeBloc>()
            .add(SearchAnime(keyword: searchController.text));
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Search Anime",
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Search anime...",
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: IconButton(
                    onPressed: _onSearch,
                    icon: const Icon(
                      Icons.search,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: BlocBuilder<SearchAnimeBloc, SearchAnimeState>(
                builder: (context, state) {
                  if (state.status == Status.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.status == Status.error) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else if (state.status == Status.success) {
                    if (state.animeList.isEmpty) {
                      return const Center(
                        child: Text("Pencarian tidak ditemukan"),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.animeList.length,
                      itemBuilder: (context, index) {
                        final AnimeModel anime = state.animeList[index];
                        return AnimeItem(
                            malId: anime.malId!,
                            imageUrl: anime.images!.jpg!.imageUrl!,
                            title: anime.title!,
                            score: anime.score!,
                            status: anime.status!,
                            synopsis: anime.synopsis!);
                      },
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
