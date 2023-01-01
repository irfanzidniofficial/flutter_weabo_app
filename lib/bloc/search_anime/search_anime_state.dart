// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_anime_bloc.dart';

class SearchAnimeState extends Equatable {
  final Status status;
  final List<AnimeModel> animeList;
  final String errorMessage;

  const SearchAnimeState(
      {required this.status,
      required this.animeList,
      required this.errorMessage});

  factory SearchAnimeState.initial() {
    return const SearchAnimeState(
        status: Status.initial, animeList: [], errorMessage: "");
  }

  @override
  List<Object> get props => [status, animeList, errorMessage];

  SearchAnimeState copyWith({
    Status? status,
    List<AnimeModel>? animeList,
    String? errorMessage,
  }) {
    return SearchAnimeState(
      status: status ?? this.status,
      animeList: animeList ?? this.animeList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
