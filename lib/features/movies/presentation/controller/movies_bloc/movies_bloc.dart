import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/domain/usecases/base_usecase.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/movies/domain/usecases/get_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUsecase _getMoviesUsecase;
  MoviesBloc(this._getMoviesUsecase) : super(const MoviesState()) {
    on<AllMoviesFetched>(_getMovies);
  }

  Future<FutureOr<void>> _getMovies(
      AllMoviesFetched event, Emitter<MoviesState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await _getMoviesUsecase(const NoParams());
    result.fold(
      (error) => emit(state.copyWith(status: RequestStatus.error)),
      (movies) =>
          emit(state.copyWith(status: RequestStatus.loaded, movies: movies)),
    );
  }
}
