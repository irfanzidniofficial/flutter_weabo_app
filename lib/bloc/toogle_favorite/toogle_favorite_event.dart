part of 'toogle_favorite_bloc.dart';

abstract class ToogleFavoriteEvent extends Equatable {
  const ToogleFavoriteEvent();

  @override
  List<Object> get props => [];
}

class AddToFavorite extends ToogleFavoriteEvent {
  final AnimeEntity animeEntity;

  const AddToFavorite({required this.animeEntity});
  @override
  List<Object> get props => [animeEntity];
}

class RemoveFromFavorite extends ToogleFavoriteEvent {
  final AnimeEntity animeEntity;

  const RemoveFromFavorite({required this.animeEntity});
  @override
  List<Object> get props => [animeEntity];
}

class CheckIsFavorite extends ToogleFavoriteEvent {
  final int id;
  const CheckIsFavorite({required this.id});

  @override
  List<Object> get props => [id];
}
