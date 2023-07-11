part of 'popular_movies_bloc.dart';

class PopularMoviesState extends Equatable {
  const PopularMoviesState({
    this.movies = const [],
    this.status = RequestStatus.loading,
  });
  final List<Media> movies;
  final RequestStatus status;

  PopularMoviesState copyWith({
    List<Media>? movies,
    RequestStatus? status,
  }) {
    return PopularMoviesState(
      movies: movies ?? this.movies,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [movies, status];
}
