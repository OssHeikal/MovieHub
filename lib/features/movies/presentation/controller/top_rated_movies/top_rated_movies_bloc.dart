import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/movies/domain/usecases/get_all_top_rated_movies_usecase.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final GetAllTopRatedMoviesUsecase getAllTopRatedMoviesUsecase;
  TopRatedMoviesBloc(
    this.getAllTopRatedMoviesUsecase,
  ) : super(const TopRatedMoviesState()) {
    on<AllTopRatedMoviesFetched>(_onTopRatedMoviesFeteched);
    on<MoreTopRatedMoviesFetched>(_onMoreTopRatedMoviesFeteched);
  }

  int _page = 1;

  FutureOr<void> _onTopRatedMoviesFeteched(
      AllTopRatedMoviesFetched event, Emitter<TopRatedMoviesState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await getAllTopRatedMoviesUsecase(_page);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.error)),
      (movies) {
        _page++;
        emit(state.copyWith(status: RequestStatus.loaded, movies: movies));
      },
    );
  }

  FutureOr<void> _onMoreTopRatedMoviesFeteched(MoreTopRatedMoviesFetched event,
      Emitter<TopRatedMoviesState> emit) async {
    final result = await getAllTopRatedMoviesUsecase(_page);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.fetchMoreError)),
      (movies) {
        _page++;
        emit(state.copyWith(
          status: RequestStatus.loaded,
          movies: state.movies + movies,
        ));
      },
    );
  }
}
