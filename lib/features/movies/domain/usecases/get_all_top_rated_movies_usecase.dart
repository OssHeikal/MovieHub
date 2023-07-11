import 'package:movie_hub/core/data/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/domain/usecases/base_usecase.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/movies/domain/repository/movies_repository.dart';

class GetAllTopRatedMoviesUsecase implements UseCase<List<Media>, int> {
  GetAllTopRatedMoviesUsecase(this._repository);
  final MoviesRepository _repository;
  @override
  Future<Either<Failure, List<Media>>> call(int page) async {
    return await _repository.getAllTopRatedMovies(page);
  }
}
