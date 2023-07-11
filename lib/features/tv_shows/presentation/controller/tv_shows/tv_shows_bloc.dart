import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/core/domain/usecases/base_usecase.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_tv_shows_use_case.dart';

part 'tv_shows_event.dart';
part 'tv_shows_state.dart';

class TvShowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  final GetTvShowsUseCase getTvShowsUseCase;
  TvShowsBloc(
    this.getTvShowsUseCase,
  ) : super(const TvShowsState()) {
    on<AllTvShowsFetched>(_onTvShowsFetched);
  }

  FutureOr<void> _onTvShowsFetched(
    AllTvShowsFetched event,
    Emitter<TvShowsState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await getTvShowsUseCase(const NoParams());
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.error)),
      (tvShows) => emit(state.copyWith(
        tvShows: tvShows,
        status: RequestStatus.loaded,
      )),
    );
  }
}
