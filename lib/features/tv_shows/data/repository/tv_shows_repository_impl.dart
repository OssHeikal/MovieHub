import 'package:dartz/dartz.dart';
import 'package:movie_hub/core/data/errors/exceptions.dart';
import 'package:movie_hub/core/data/errors/failure.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';
import 'package:movie_hub/features/tv_shows/data/datasource/tv_shows_remote_data_source.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/episode_details.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/season_details.dart';
import 'package:movie_hub/features/tv_shows/domain/repository/tv_shows_repository.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_episode_details_use_case.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_season_details_use_case.dart';

class TvShowsRepositoryImpl extends TvShowsRepository {
  TvShowsRepositoryImpl(this.remoteDataSource);
  final TvShowsRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Media>>> getAllPopularTvShows(int page) async {
    return await _getTvShowsOrFailure(
        () => remoteDataSource.getAllPopularTvShows(page));
  }

  @override
  Future<Either<Failure, List<Media>>> getAllopRatedTvShows(int page) async {
    return await _getTvShowsOrFailure(
        () => remoteDataSource.getAllTopRatedTvShows(page));
  }

  @override
  Future<Either<Failure, EpisodeDetails>> getEpisodeDetails(
    EpisodeParams episodeParams,
  ) async {
    return await _getTvShowsOrFailure(
        () => remoteDataSource.getEpisodeDetails(episodeParams));
  }

  @override
  Future<Either<Failure, SeasonDetails>> getSeasonDetails(
    SeasonParams seasonParams,
  ) async {
    return await _getTvShowsOrFailure(
        () => remoteDataSource.getSeasonDetails(seasonParams));
  }

  @override
  Future<Either<Failure, MediaDetails>> getTvShowDetails(int tvShowId) async {
    return await _getTvShowsOrFailure(
        () => remoteDataSource.getTvShowDetails(tvShowId));
  }

  @override
  Future<Either<Failure, List<List<Media>>>> getTvShows() async {
    return await _getTvShowsOrFailure(() => remoteDataSource.getTvShows());
  }

  Future<Either<Failure, Success>> _getTvShowsOrFailure<Success>(
      Future<Success> Function() getTvShows) async {
    try {
      return Right(await getTvShows());
    } on ServerException catch (_) {
      return Left(ServerFailure());
    } on NoInternetException catch (_) {
      return Left(NoInternetConnectionFailure());
    } catch (_) {
      return Left(UnexpectedFailure());
    }
  }
}
