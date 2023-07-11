import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/episode_details.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_episode_details_use_case.dart';

part 'episode_details_event.dart';
part 'episode_details_state.dart';

class EpisodeDetailsBloc
    extends Bloc<EpisodeDetailsEvent, EpisodeDetailsState> {
  final GetEpisodeDetailsUseCase getEpisodeDetailsUseCase;
  EpisodeDetailsBloc(
    this.getEpisodeDetailsUseCase,
  ) : super(const EpisodeDetailsState()) {
    on<EpisodeDetailsFetched>(_onEpisodeDetailsFetched);
  }

  FutureOr<void> _onEpisodeDetailsFetched(
    EpisodeDetailsFetched event,
    Emitter<EpisodeDetailsState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await getEpisodeDetailsUseCase(event.episodeParams);
    result.fold(
      (failure) => emit(state.copyWith(status: RequestStatus.error)),
      (episodeDetails) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          episodeDetails: episodeDetails,
        ),
      ),
    );
  }
}
