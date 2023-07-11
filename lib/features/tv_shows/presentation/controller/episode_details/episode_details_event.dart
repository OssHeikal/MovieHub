part of 'episode_details_bloc.dart';

abstract class EpisodeDetailsEvent extends Equatable {
  const EpisodeDetailsEvent();

  @override
  List<Object> get props => [];
}

class EpisodeDetailsFetched extends EpisodeDetailsEvent {
  const EpisodeDetailsFetched(this.episodeParams);

  final EpisodeParams episodeParams;

  @override
  List<Object> get props => [episodeParams];
}
