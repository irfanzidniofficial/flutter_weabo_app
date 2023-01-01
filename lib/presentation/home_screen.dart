import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weabo_app/bloc/anime_list/anime_list_bloc.dart';
import 'package:flutter_weabo_app/model/anime_model.dart';
import 'package:flutter_weabo_app/shared/style.dart';
import 'package:flutter_weabo_app/widget/anime_item.dart';

import '../shared/status_enum.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AnimeListBloc, AnimeListState>(
          listener: (context, state) {
            if (state.status == Status.error) {
              AnimatedSnackBar.material(
                state.errorMessage,
                type: AnimatedSnackBarType.error,
              ).show(context);
            }
          },
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == Status.error) {
              return const Center(
                child: Text("Maaf terjadi kesalahan"),
              );
            } else if (state.status == Status.success) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Weabo App",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.animeList.length,
                      itemBuilder: (context, index) {
                        final AnimeModel anime = state.animeList[index];
                        return AnimeItem(
                            imageUrl: anime.images!.jpg!.imageUrl!,
                            title: anime.title!,
                            score: anime.score!,
                            status: anime.status!,
                            synopsis: anime.synopsis!);
                      },
                    ),
                  ),
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
