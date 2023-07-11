import 'package:movie_hub/core/data/errors/exceptions.dart';
import 'package:movie_hub/core/helper/list_formatter.dart';
import 'package:movie_hub/core/services/api_services.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_api_constans.dart';
import 'package:movie_hub/features/tv_shows/data/models/episode_details_model.dart';
import 'package:movie_hub/features/tv_shows/data/models/season_details_model.dart';
import 'package:movie_hub/features/tv_shows/data/models/tv_show_details_model.dart';
import 'package:movie_hub/features/tv_shows/data/models/tv_show_model.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_episode_details_use_case.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_season_details_use_case.dart';

abstract class TvShowsRemoteDataSource {
  Future<List<TvShowModel>> getOnAirTVShows();
  Future<List<TvShowModel>> getPopularTvShows();
  Future<List<TvShowModel>> getTopRatedTvShows();
  Future<List<List<TvShowModel>>> getTvShows();
  Future<List<TvShowModel>> getAllPopularTvShows(int page);
  Future<List<TvShowModel>> getAllTopRatedTvShows(int page);
  Future<TvShowDetailsModel> getTvShowDetails(int tvShowId);
  Future<SeasonDetailsModel> getSeasonDetails(SeasonParams seasonParams);
  Future<EpisodeDetailsModel> getEpisodeDetails(EpisodeParams episodeParams);
}

class TvShowsRemoteDataSourceImpl implements TvShowsRemoteDataSource {
  TvShowsRemoteDataSourceImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<List<List<TvShowModel>>> getTvShows() async {
    return await Future.wait(
      [
        getOnAirTVShows(),
        getPopularTvShows(),
        getTopRatedTvShows(),
      ],
    );
  }

  @override
  Future<List<TvShowModel>> getOnAirTVShows() async {
    return await fetchTvShowData<List<TvShowModel>>(
      TvShowsApiConstants.onTheAirTvShows,
      (json) => ListFormatter.getTvShowsList(json['results']),
    );
  }

  @override
  Future<List<TvShowModel>> getPopularTvShows() async {
    return await fetchTvShowData<List<TvShowModel>>(
      TvShowsApiConstants.popularTvShows,
      (json) => ListFormatter.getTvShowsList(json['results']),
    );
  }

  @override
  Future<List<TvShowModel>> getTopRatedTvShows() async {
    return await fetchTvShowData<List<TvShowModel>>(
      TvShowsApiConstants.topRatedTvShows,
      (json) => ListFormatter.getTvShowsList(json['results']),
    );
  }

  @override
  Future<List<TvShowModel>> getAllPopularTvShows(int page) async {
    return await fetchTvShowData<List<TvShowModel>>(
      TvShowsApiConstants.getAllPopularTvShowsUrl(page),
      (json) => ListFormatter.getTvShowsList(json['results']),
    );
  }

  @override
  Future<List<TvShowModel>> getAllTopRatedTvShows(int page) async {
    return await fetchTvShowData<List<TvShowModel>>(
      TvShowsApiConstants.getAllTopRatedTvShowsUrl(page),
      (json) => ListFormatter.getTvShowsList(json['results']),
    );
  }

  @override
  Future<TvShowDetailsModel> getTvShowDetails(int tvShowId) async {
    return await fetchTvShowData<TvShowDetailsModel>(
      TvShowsApiConstants.getTvShowDetailsUrl(tvShowId),
      (json) => TvShowDetailsModel.fromJson(json),
    );
  }

  @override
  Future<SeasonDetailsModel> getSeasonDetails(SeasonParams seasonParams) async {
    return await fetchTvShowData<SeasonDetailsModel>(
      TvShowsApiConstants.getSeasonDetailsUrl(seasonParams),
      (json) => SeasonDetailsModel.fromJson(json),
    );
  }

  @override
  Future<EpisodeDetailsModel> getEpisodeDetails(
    EpisodeParams episodeParams,
  ) async {
    return await fetchTvShowData<EpisodeDetailsModel>(
      TvShowsApiConstants.getEpisodeDetailsUrl(episodeParams),
      (json) => EpisodeDetailsModel.fromJson(json),
    );
  }

  Future<T> fetchTvShowData<T>(
    String endpoint,
    T Function(dynamic) fromJson,
  ) async {
    try {
      final response = await apiService.getData(endpoint);
      if (response.statusCode == 200) {
        return fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw UnexpectedException();
    }
  }
}
