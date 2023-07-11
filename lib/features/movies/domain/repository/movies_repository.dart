import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/data/errors/failure.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<List<Media>>>> getMovies();
  Future<Either<Failure, List<Media>>> getAllPopularMovies(int page);
  Future<Either<Failure, List<Media>>> getAllTopRatedMovies(int page);
  Future<Either<Failure, List<Media>>> getAllUpcomingMovies(int page);
  Future<Either<Failure, MediaDetails>> getMovieDetails(int movieId);
}
