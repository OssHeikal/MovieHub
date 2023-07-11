import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/data/errors/failure.dart';
import 'package:movie_hub/core/domain/usecases/base_usecase.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/season_details.dart';
import 'package:movie_hub/features/tv_shows/domain/repository/tv_shows_repository.dart';

class GetSeasonDetailsUseCase extends UseCase<SeasonDetails, SeasonParams> {
  GetSeasonDetailsUseCase(this.tvShowsRepository);
  final TvShowsRepository tvShowsRepository;

  @override
  Future<Either<Failure, SeasonDetails>> call(SeasonParams params) async {
    return await tvShowsRepository.getSeasonDetails(params);
  }
}

class SeasonParams extends Equatable {
  const SeasonParams(
    this.tvShowID,
    this.seasonNumber,
  );
  final int tvShowID;
  final int seasonNumber;

  @override
  List<Object> get props => [tvShowID, seasonNumber];
}
