import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/movies/domain/usecases/get_all_upcoming_movies_usecase.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final GetAllUpcomingMoviesUsecase getAllUpcomingMoviesUsecase;
  UpcomingMoviesBloc(
    this.getAllUpcomingMoviesUsecase,
  ) : super(const UpcomingMoviesState()) {
    on<AllUpcomingMoviesFetched>(_onUpcomingMoviesFeteched);
    on<MoreUpcomingMoviesFetched>(_onMoreUpcomingMoviesFeteched);
  }

  int _page = 1;

  FutureOr<void> _onUpcomingMoviesFeteched(
      AllUpcomingMoviesFetched event, Emitter<UpcomingMoviesState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await getAllUpcomingMoviesUsecase(_page);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.error)),
      (movies) {
        _page++;
        emit(state.copyWith(status: RequestStatus.loaded, movies: movies));
      },
    );
  }

  FutureOr<void> _onMoreUpcomingMoviesFeteched(MoreUpcomingMoviesFetched event,
      Emitter<UpcomingMoviesState> emit) async {
    final result = await getAllUpcomingMoviesUsecase(_page);
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
