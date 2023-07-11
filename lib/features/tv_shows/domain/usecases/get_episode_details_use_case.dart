import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/data/errors/failure.dart';
import 'package:movie_hub/core/domain/usecases/base_usecase.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/episode_details.dart';
import 'package:movie_hub/features/tv_shows/domain/repository/tv_shows_repository.dart';

class GetEpisodeDetailsUseCase extends UseCase<EpisodeDetails, EpisodeParams> {
  GetEpisodeDetailsUseCase(this.tvShowsRepository);
  final TvShowsRepository tvShowsRepository;

  @override
  Future<Either<Failure, EpisodeDetails>> call(EpisodeParams params) async {
    return await tvShowsRepository.getEpisodeDetails(params);
  }
}

class EpisodeParams extends Equatable {
  const EpisodeParams(
    this.tvShowID,
    this.seasonNumber,
    this.episodeNumber,
  );
  final int tvShowID;
  final int seasonNumber;
  final int episodeNumber;

  @override
  List<Object> get props => [tvShowID, seasonNumber, episodeNumber];
}
