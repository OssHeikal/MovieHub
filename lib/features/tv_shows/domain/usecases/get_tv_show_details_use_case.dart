import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/data/errors/failure.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';
import 'package:movie_hub/core/domain/usecases/base_usecase.dart';
import 'package:movie_hub/features/tv_shows/domain/repository/tv_shows_repository.dart';

class GetTvShowDetailsUseCase extends UseCase<MediaDetails, int> {
  GetTvShowDetailsUseCase(this.repository);
  final TvShowsRepository repository;

  @override
  Future<Either<Failure, MediaDetails>> call(int params) async {
    return await repository.getTvShowDetails(params);
  }
}
