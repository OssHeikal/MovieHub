import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/data/errors/failure.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/core/domain/usecases/base_usecase.dart';
import 'package:movie_hub/features/tv_shows/domain/repository/tv_shows_repository.dart';

class GetAllTopRatedTvShowsUseCase extends UseCase<List<Media>, int> {
  GetAllTopRatedTvShowsUseCase(this.repository);
  final TvShowsRepository repository;

  @override
  Future<Either<Failure, List<Media>>> call(int params) async {
    return await repository.getAllopRatedTvShows(params);
  }
}
