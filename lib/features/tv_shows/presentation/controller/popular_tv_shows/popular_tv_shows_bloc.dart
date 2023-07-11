import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_all_popular_tv_shows_use_case.dart';

part 'popular_tv_shows_event.dart';
part 'popular_tv_shows_state.dart';

class PopularTvShowsBloc
    extends Bloc<PopularTvShowsEvent, PopularTvShowsState> {
  final GetAllPopularTvShowsUseCase getAllPopularTvShowsUseCase;
  PopularTvShowsBloc(
    this.getAllPopularTvShowsUseCase,
  ) : super(const PopularTvShowsState()) {
    on<AllPopularTvShowsFetched>(_onPopularTvShowsFetched);
    on<MorePopularTvShowsFetched>(_onMorePopularTvShowsFetched);
  }

  int _page = 1;

  FutureOr<void> _onPopularTvShowsFetched(
    AllPopularTvShowsFetched event,
    Emitter<PopularTvShowsState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await getAllPopularTvShowsUseCase(_page);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.error)),
      (movies) {
        _page++;
        emit(
          state.copyWith(
            status: RequestStatus.loaded,
            popularTvShows: state.popularTvShows + movies,
          ),
        );
      },
    );
  }

  FutureOr<void> _onMorePopularTvShowsFetched(
    MorePopularTvShowsFetched event,
    Emitter<PopularTvShowsState> emit,
  ) async {
    final result = await getAllPopularTvShowsUseCase(_page);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.fetchMoreError)),
      (movies) {
        _page++;
        emit(
          state.copyWith(
            status: RequestStatus.loaded,
            popularTvShows: state.popularTvShows + movies,
          ),
        );
      },
    );
  }
}
