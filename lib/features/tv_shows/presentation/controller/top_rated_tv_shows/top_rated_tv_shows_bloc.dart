import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_all_top_rated_tv_shows_use_case.dart';

part 'top_rated_tv_shows_event.dart';
part 'top_rated_tv_shows_state.dart';

class TopRatedTvShowsBloc
    extends Bloc<TopRatedTvShowsEvent, TopRatedTvShowsState> {
  final GetAllTopRatedTvShowsUseCase getAllTopRatedTvShowsUseCase;
  TopRatedTvShowsBloc(
    this.getAllTopRatedTvShowsUseCase,
  ) : super(const TopRatedTvShowsState()) {
    on<AllTopRatedTvShowsFetched>(_onAllTopRatedTvShowsFetched);
    on<MoreTopRatedTvShowsFetched>(_onMoreTopRatedTvShowsFetched);
  }

  int _page = 1;

  FutureOr<void> _onAllTopRatedTvShowsFetched(
    AllTopRatedTvShowsFetched event,
    Emitter<TopRatedTvShowsState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await getAllTopRatedTvShowsUseCase(_page);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.error)),
      (topRatedTvShows) {
        _page++;
        emit(
          state.copyWith(
            status: RequestStatus.loaded,
            topRatedTvShows: topRatedTvShows,
          ),
        );
      },
    );
  }

  FutureOr<void> _onMoreTopRatedTvShowsFetched(
    MoreTopRatedTvShowsFetched event,
    Emitter<TopRatedTvShowsState> emit,
  ) async {
    final result = await getAllTopRatedTvShowsUseCase(_page);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.fetchMoreError)),
      (tvShows) {
        _page++;
        emit(
          state.copyWith(
            status: RequestStatus.loaded,
            topRatedTvShows: state.topRatedTvShows + tvShows,
          ),
        );
      },
    );
  }
}
