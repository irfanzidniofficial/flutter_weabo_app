// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weabo_app/bloc/anime_detail/anime_detail_bloc.dart';
import 'package:flutter_weabo_app/model/anime_detail_model.dart';

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
              final AnimeDetailModel animeDetail = state.anime;
              print(state.anime.data!.title!);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 2,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            child: Image.network(
                              animeDetail.data!.images!.jpg!.imageUrl!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            height: 60,
                            width: 75,
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 30,
                                ),
                                Text(
                                  "${animeDetail.data!.score!}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Text(
                            animeDetail.data!.title!,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          const SizedBox(height: 5),
                          Card(
                            elevation: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Episode",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(fontSize: 16),
                                      ),
                                      Text("${animeDetail.data!.episodes!}")
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Status",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(fontSize: 16),
                                      ),
                                      Text(animeDetail.data!.status!),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Duration",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(fontSize: 16),
                                      ),
                                      Text(animeDetail.data!.duration!)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Card(
                            elevation: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Synopsis",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    animeDetail.data!.synopsis!,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ));
  }
}
