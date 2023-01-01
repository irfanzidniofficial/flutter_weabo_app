part of 'anime_detail_bloc.dart';

abstract class AnimeDetailState extends Equatable {
  const AnimeDetailState();

  @override
  List<Object> get props => [];
}

class AnimeDetailInitial extends AnimeDetailState {
  @override
  List<Object> get props => [];
}

class GetAnimeDetailLoading extends AnimeDetailState {
  @override
  List<Object> get props => [];
}

class GetAnimeDetailSuccess extends AnimeDetailState {
  const GetAnimeDetailSuccess({required this.anime});
  final AnimeDetailModel anime;

  @override
  List<Object> get props => [anime];
}

class GetAnimeDetailError extends AnimeDetailState {
  const GetAnimeDetailError({required this.errorMessage});
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
