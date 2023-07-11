import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/season_details.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_season_details_use_case.dart';

part 'season_details_event.dart';
part 'season_details_state.dart';

class SeasonDetailsBloc extends Bloc<SeasonDetailsEvent, SeasonDetailsState> {
  final GetSeasonDetailsUseCase getSeasonDetailsUseCase;
  SeasonDetailsBloc(
    this.getSeasonDetailsUseCase,
  ) : super(const SeasonDetailsState()) {
    on<SeasonDetailsFetched>(_onSeasonDetailsFetched);
  }

  FutureOr<void> _onSeasonDetailsFetched(
    SeasonDetailsFetched event,
    Emitter<SeasonDetailsState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await getSeasonDetailsUseCase(event.seasonParams);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.error)),
      (seasonDetails) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          seasonDetails: seasonDetails,
        ),
      ),
    );
  }
}
