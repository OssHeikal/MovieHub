part of 'top_rated_tv_shows_bloc.dart';

class TopRatedTvShowsState extends Equatable {
  const TopRatedTvShowsState({
    this.status = RequestStatus.loading,
    this.topRatedTvShows = const <Media>[],
  });

  final RequestStatus status;
  final List<Media> topRatedTvShows;

  TopRatedTvShowsState copyWith({
    RequestStatus? status,
    List<Media>? topRatedTvShows,
  }) {
    return TopRatedTvShowsState(
      status: status ?? this.status,
      topRatedTvShows: topRatedTvShows ?? this.topRatedTvShows,
    );
  }

  @override
  List<Object> get props => [status, topRatedTvShows];
}
