part of 'search_anime_bloc.dart';

abstract class SearchAnimeEvent extends Equatable {
  const SearchAnimeEvent();

  @override
  List<Object> get props => [];
}

class SearchAnime extends SearchAnimeEvent {
  final String keyword;
  const SearchAnime({required this.keyword});

  @override
  List<Object> get props => [keyword];
}
