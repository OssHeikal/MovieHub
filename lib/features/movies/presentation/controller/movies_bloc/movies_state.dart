part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  const MoviesState({
    this.movies = const [],
    this.status = RequestStatus.loading,
  });
  final List<List<Media>> movies;
  final RequestStatus status;

  MoviesState copyWith({
    List<List<Media>>? movies,
    RequestStatus? status,
  }) {
    return MoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
    );
  }

  @override
  List<Object> get props => [movies, status];
}
