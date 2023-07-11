import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_tv_show_details_use_case.dart';

part 'tv_show_details_event.dart';
part 'tv_show_details_state.dart';

class TvShowDetailsBloc extends Bloc<TvShowDetailsEvent, TvShowDetailsState> {
  final GetTvShowDetailsUseCase getTvShowDetailsUseCase;
  TvShowDetailsBloc(
    this.getTvShowDetailsUseCase,
  ) : super(const TvShowDetailsState()) {
    on<TvShowDetailsFetched>(_onTvShowDetailsFetched);
  }

  FutureOr<void> _onTvShowDetailsFetched(
    TvShowDetailsFetched event,
    Emitter<TvShowDetailsState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await getTvShowDetailsUseCase(event.showId);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.error)),
      (tvShowDetails) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          tvShowDetails: tvShowDetails,
        ),
      ),
    );
  }
}
