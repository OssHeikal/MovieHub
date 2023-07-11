import 'package:movie_hub/core/data/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/domain/usecases/base_usecase.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';
import 'package:movie_hub/features/movies/domain/repository/movies_repository.dart';

class GetMovieDetailsUsecase implements UseCase<MediaDetails, int> {
  GetMovieDetailsUsecase(this.repository);
  MoviesRepository repository;

  @override
  Future<Either<Failure, MediaDetails>> call(int movieId) async {
    return await repository.getMovieDetails(movieId);
  }
}
