import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/movies/domain/usecases/get_all_popular_movies_usecase.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetAllPopularMoviesUsecase getAllPopularMoviesUsecase;
  PopularMoviesBloc(
    this.getAllPopularMoviesUsecase,
  ) : super(const PopularMoviesState()) {
    on<AllPopularMoviesFetched>(_onAllPopularMoviesFeteched);
    on<MorePopularMoviesFetched>(_onMorePopularMoviesFeteched);
  }

  int _page = 1;

  FutureOr<void> _onAllPopularMoviesFeteched(
    AllPopularMoviesFetched event,
    Emitter<PopularMoviesState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await getAllPopularMoviesUsecase(_page);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.error)),
      (movies) {
        _page++;
        emit(state.copyWith(status: RequestStatus.loaded, movies: movies));
      },
    );
  }

  FutureOr<void> _onMorePopularMoviesFeteched(
    MorePopularMoviesFetched event,
    Emitter<PopularMoviesState> emit,
  ) async {
    final result = await getAllPopularMoviesUsecase(_page);
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
