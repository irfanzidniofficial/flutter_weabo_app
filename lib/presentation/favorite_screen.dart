import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weabo_app/bloc/favorite_anime_list/favorite_anime_list_bloc.dart';
import 'package:flutter_weabo_app/model/local/anime_entity.dart';
import 'package:flutter_weabo_app/shared/style.dart';

import '../widget/anime_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteAnimeListBloc>().add(GetFavoriteAnime());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Favorite Screen",
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: BlocBuilder<FavoriteAnimeListBloc, FavoriteAnimeListState>(
        builder: (context, state) {
          if (state is FavoriteAnimeListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FavoriteAnimeListError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is FavoriteAnimeListSucess) {
            if (state.favoriteAnimeList.isEmpty) {
              return const Center(
                child: Text("Favorite masih kosong"),
              );
            }
            return ListView.builder(
              itemCount: state.favoriteAnimeList.length,
              itemBuilder: (context, index) {
                final AnimeEntity anime = state.favoriteAnimeList[index];
                return AnimeItem(
                  malId: anime.id,
                  imageUrl: anime.imageUrl,
                  title: anime.title,
                  score: anime.score,
                  status: anime.status,
                  synopsis: anime.synopsis,
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
