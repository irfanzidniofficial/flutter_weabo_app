import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weabo_app/model/remote/anime_detail_model.dart';
import 'package:flutter_weabo_app/services/service.dart';

part 'anime_detail_event.dart';
part 'anime_detail_state.dart';

class AnimeDetailBloc extends Bloc<AnimeDetailEvent, AnimeDetailState> {
  AnimeDetailBloc() : super(AnimeDetailInitial()) {
    on<GetAnimeDetailEvent>((event, emit) async {
      emit(GetAnimeDetailLoading());

      try {
        final response = await Service().getDetail(event.id);
        emit(GetAnimeDetailSuccess(anime: response));
      } catch (e) {
        emit(const GetAnimeDetailError(errorMessage: "Terjadi Kesalahan"));
      }
    });
  }
}
