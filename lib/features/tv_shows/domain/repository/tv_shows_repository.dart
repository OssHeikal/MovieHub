import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/data/errors/failure.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/episode_details.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/season_details.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_episode_details_use_case.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_season_details_use_case.dart';

abstract class TvShowsRepository {
  Future<Either<Failure, List<List<Media>>>> getTvShows();
  Future<Either<Failure, List<Media>>> getAllPopularTvShows(int page);
  Future<Either<Failure, List<Media>>> getAllopRatedTvShows(int page);
  Future<Either<Failure, MediaDetails>> getTvShowDetails(int tvShowId);
  Future<Either<Failure, SeasonDetails>> getSeasonDetails(
      SeasonParams seasonParams);
  Future<Either<Failure, EpisodeDetails>> getEpisodeDetails(
      EpisodeParams episodeParams);
}
