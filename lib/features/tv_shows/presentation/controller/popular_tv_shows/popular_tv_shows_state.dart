part of 'popular_tv_shows_bloc.dart';

class PopularTvShowsState extends Equatable {
  const PopularTvShowsState({
    this.status = RequestStatus.loading,
    this.popularTvShows = const <Media>[],
  });
  final RequestStatus status;
  final List<Media> popularTvShows;

  PopularTvShowsState copyWith({
    RequestStatus? status,
    List<Media>? popularTvShows,
  }) {
    return PopularTvShowsState(
      status: status ?? this.status,
      popularTvShows: popularTvShows ?? this.popularTvShows,
    );
  }

  @override
  List<Object> get props => [status, popularTvShows];
}
