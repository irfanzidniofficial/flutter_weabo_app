part of 'anime_detail_bloc.dart';

abstract class AnimeDetailEvent extends Equatable {
  const AnimeDetailEvent();

  @override
  List<Object> get props => [];
}

class GetAnimeDetailEvent extends AnimeDetailEvent {
  const GetAnimeDetailEvent({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}
