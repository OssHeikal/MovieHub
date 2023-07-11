part of 'tv_shows_bloc.dart';

class TvShowsState extends Equatable {
  const TvShowsState({
    this.tvShows = const [],
    this.status = RequestStatus.loading,
  });

  final List<List<Media>> tvShows;
  final RequestStatus status;

  TvShowsState copyWith({
    List<List<Media>>? tvShows,
    RequestStatus? status,
  }) {
    return TvShowsState(
      tvShows: tvShows ?? this.tvShows,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [tvShows, status];
}
