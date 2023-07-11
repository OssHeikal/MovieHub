part of 'upcoming_movies_bloc.dart';

class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState({
    this.status = RequestStatus.loading,
    this.movies = const <Media>[],
  });

  final RequestStatus status;
  final List<Media> movies;

  UpcomingMoviesState copyWith({
    RequestStatus? status,
    List<Media>? movies,
  }) {
    return UpcomingMoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
    );
  }

  @override
  List<Object> get props => [status, movies];
}
