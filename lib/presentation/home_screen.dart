import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weabo_app/bloc/anime_list/anime_list_bloc.dart';
import 'package:flutter_weabo_app/model/anime_model.dart';

import '../shared/status_enum.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AnimeListBloc>().add(GetAnimeListEvent());
  }

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
              return ListView.builder(
                itemCount: state.animeList.length,
                itemBuilder: (context, index) {
                  final AnimeModel anime = state.animeList[index];
                  return Container();
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
