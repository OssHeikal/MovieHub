part of 'episode_details_bloc.dart';

class EpisodeDetailsState extends Equatable {
  const EpisodeDetailsState({
    this.status = RequestStatus.loading,
    this.episodeDetails = const EpisodeDetails.empty(),
  });

  final RequestStatus status;
  final EpisodeDetails episodeDetails;

  EpisodeDetailsState copyWith({
    RequestStatus? status,
    EpisodeDetails? episodeDetails,
  }) {
    return EpisodeDetailsState(
      status: status ?? this.status,
      episodeDetails: episodeDetails ?? this.episodeDetails,
    );
  }

  @override
  List<Object> get props => [status, episodeDetails];
}
