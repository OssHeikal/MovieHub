import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/data/errors/failure.dart';
import 'package:movie_hub/core/domain/usecases/base_usecase.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/movies/domain/repository/movies_repository.dart';

class GetMoviesUsecase implements UseCase<List<List<Media>>, NoParams> {
  final MoviesRepository repository;

  GetMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<List<Media>>>> call(NoParams p) async {
    return await repository.getMovies();
  }
}
