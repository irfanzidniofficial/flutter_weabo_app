part of 'toogle_favorite_bloc.dart';

class ToogleFavoriteState extends Equatable {
  final Status status;
  final bool isFavorite;
  final String errorMessage;

  const ToogleFavoriteState({
    required this.isFavorite,
    required this.errorMessage,
    required this.status,
  });

  factory ToogleFavoriteState.initial() {
    return const ToogleFavoriteState(
      status: Status.initial,
      isFavorite: false,
      errorMessage: "",
    );
  }

  @override
  List<Object> get props => [isFavorite, errorMessage];

  ToogleFavoriteState copyWith({
    Status? status,
    bool? isFavorite,
    String? errorMessage,
  }) {
    return ToogleFavoriteState(
      status: status ?? this.status,
      isFavorite: isFavorite ?? this.isFavorite,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
