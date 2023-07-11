part of 'top_rated_movies_bloc.dart';

class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState({
    this.status = RequestStatus.loading,
    this.movies = const <Media>[],
  });

  final RequestStatus status;
  final List<Media> movies;

  TopRatedMoviesState copyWith({
    RequestStatus? status,
    List<Media>? movies,
  }) {
    return TopRatedMoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
    );
  }

  @override
  List<Object> get props => [status, movies];
}
