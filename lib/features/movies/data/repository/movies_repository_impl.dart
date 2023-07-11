import 'package:movie_hub/core/data/errors/exceptions.dart';
import 'package:movie_hub/core/data/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_hub/features/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/movies/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl(this.moviesRemoteDatasource);
  final MoviesRemoteDatasource moviesRemoteDatasource;

  @override
  Future<Either<Failure, List<Media>>> getAllPopularMovies(int page) async {
    return await _getMoviesOrFailure(
        () => moviesRemoteDatasource.getAllPopularMovies(page));
  }

  @override
  Future<Either<Failure, List<Media>>> getAllTopRatedMovies(int page) async {
    return await _getMoviesOrFailure(
        () => moviesRemoteDatasource.getAllTopRatedMovies(page));
  }

  @override
  Future<Either<Failure, List<Media>>> getAllUpcomingMovies(int page) async {
    return await _getMoviesOrFailure(
        () => moviesRemoteDatasource.getAllUpcomingMovies(page));
  }

  @override
  Future<Either<Failure, MediaDetails>> getMovieDetails(int movieId) async {
    return await _getMoviesOrFailure(
        () => moviesRemoteDatasource.getMovieDetails(movieId));
  }

  @override
  Future<Either<Failure, List<List<Media>>>> getMovies() async {
    return await _getMoviesOrFailure(
        () => moviesRemoteDatasource.getAllMovies());
  }

  Future<Either<Failure, Success>> _getMoviesOrFailure<Success>(
      Future<Success> Function() getMovies) async {
    try {
      return Right(await getMovies());
    } on ServerException catch (_) {
      return Left(ServerFailure());
    } on NoInternetException catch (_) {
      return Left(NoInternetConnectionFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }
}
