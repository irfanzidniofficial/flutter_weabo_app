part of 'favorite_anime_list_bloc.dart';

abstract class FavoriteAnimeListState extends Equatable {
  const FavoriteAnimeListState();

  @override
  List<Object> get props => [];
}

class FavoriteAnimeListInitial extends FavoriteAnimeListState {
  @override
  List<Object> get props => [];
}

class FavoriteAnimeListLoading extends FavoriteAnimeListState {
  @override
  List<Object> get props => [];
}

class FavoriteAnimeListError extends FavoriteAnimeListState {
  final String errorMessage;

  const FavoriteAnimeListError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class FavoriteAnimeListSucess extends FavoriteAnimeListState {
  final List<AnimeEntity> favoriteAnimeList;

  const FavoriteAnimeListSucess({required this.favoriteAnimeList});
  @override
  List<Object> get props => [favoriteAnimeList];
}
