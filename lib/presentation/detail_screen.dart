// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weabo_app/bloc/anime_detail/anime_detail_bloc.dart';

import 'package:flutter_weabo_app/route_argument/detail_arguments.dart';
import 'package:flutter_weabo_app/shared/style.dart';

class DetailScreen extends StatefulWidget {
  final DetailArguments detailArguments;
  const DetailScreen({
    Key? key,
    required this.detailArguments,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<AnimeDetailBloc>()
        .add(GetAnimeDetailEvent(id: widget.detailArguments.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: whiteColor,
              )),
          title: Text(
            widget.detailArguments.title,
            style: const TextStyle(
              color: whiteColor,
            ),
          ),
        ),
        body: BlocBuilder<AnimeDetailBloc, AnimeDetailState>(
          builder: (context, state) {
            if (state is GetAnimeDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetAnimeDetailError) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is GetAnimeDetailSuccess) {
              print(state.anime.title);
              return Container();
            }
            return Container();
          },
        ));
  }
}
