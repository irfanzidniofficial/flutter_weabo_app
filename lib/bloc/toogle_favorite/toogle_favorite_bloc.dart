import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weabo_app/model/local/anime_entity.dart';
import 'package:flutter_weabo_app/shared/app_database.dart';

import '../../shared/status_enum.dart';

part 'toogle_favorite_event.dart';
part 'toogle_favorite_state.dart';

class ToogleFavoriteBloc
    extends Bloc<ToogleFavoriteEvent, ToogleFavoriteState> {
  ToogleFavoriteBloc() : super(ToogleFavoriteState.initial()) {
    on<AddToFavorite>((event, emit) async {
      try {
        final database =
            await $FloorAppDatabase.databaseBuilder('app_database.db').build();
        final animeDao = database.animeDao;
        final int result = await animeDao.addToFavorite(event.animeEntity);

        if (result > 0) {
          emit(state.copyWith(status: Status.success, isFavorite: true));
        } else {
          emit(
            state.copyWith(status: Status.error, errorMessage: ""),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(status: Status.error, errorMessage: ""),
        );
      }
    });
    on<RemoveFromFavorite>((event, emit) async {
      try {
        final database =
            await $FloorAppDatabase.databaseBuilder('app_database.db').build();
        final animeDao = database.animeDao;
        final int result = await animeDao.removeFromFavorite(event.animeEntity);

        if (result > 0) {
          emit(state.copyWith(status: Status.success, isFavorite: false));
        } else {
          emit(
            state.copyWith(status: Status.error, errorMessage: ""),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(status: Status.error, errorMessage: ""),
        );
      }
    });
    on<CheckIsFavorite>((event, emit) async {
      try {
        final database =
            await $FloorAppDatabase.databaseBuilder('app_database.db').build();
        final animeDao = database.animeDao;
        final result = await animeDao.checkIsFavorite(event.id);

        if (result != null) {
          emit(state.copyWith(isFavorite: true, status: Status.success));
        } else {
          emit(state.copyWith(isFavorite: false, status: Status.success));
        }
      } catch (e) {
        emit(
          state.copyWith(status: Status.error, errorMessage: ""),
        );
      }
    });
  }
}
