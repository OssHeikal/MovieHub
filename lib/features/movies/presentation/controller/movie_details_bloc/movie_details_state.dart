part of 'movie_details_bloc.dart';

class MovieDetailsState {
  const MovieDetailsState({
    this.status = RequestStatus.loading,
    this.movieDetails,
  });
  final RequestStatus status;
  final MediaDetails? movieDetails;

  MovieDetailsState copyWith({
    RequestStatus? status,
    MediaDetails? movieDetails,
  }) {
    return MovieDetailsState(
      status: status ?? this.status,
      movieDetails: movieDetails ?? this.movieDetails,
    );
  }
}
