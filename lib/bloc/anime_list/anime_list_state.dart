// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'anime_list_bloc.dart';

class AnimeListState extends Equatable {
  final Status status;
  final List<AnimeModel> animeList;
  final String errorMessage;
  const AnimeListState({
    required this.status,
    required this.animeList,
    required this.errorMessage,
  });

  factory AnimeListState.initial() {
    return const AnimeListState(
      status: Status.initial,
      animeList: [],
      errorMessage: '',
    );
  }

  @override
  List<Object> get props => [status, animeList, errorMessage];

  AnimeListState copyWith({
    Status? status,
    List<AnimeModel>? animeList,
    String? errorMessage,
  }) {
    return AnimeListState(
      status: status ?? this.status,
      animeList: animeList ?? this.animeList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
