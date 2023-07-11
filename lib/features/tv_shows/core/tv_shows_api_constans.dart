import 'package:movie_hub/core/data/network/api_constants.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_episode_details_use_case.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_season_details_use_case.dart';

class TvShowsApiConstants {
  static const String baseUrl = ApiConstants.baseUrl;
  static const String apiKey = ApiConstants.apiKey;

  static const String onTheAirTvShows =
      '$baseUrl/tv/on_the_air?api_key=$apiKey&with_original_language=en';
  static const String popularTvShows =
      '$baseUrl/tv/popular?api_key=$apiKey&with_original_language=en';
  static const String topRatedTvShows =
      '$baseUrl/tv/top_rated?api_key=$apiKey&with_original_language=en';

  static String getTvShowDetailsUrl(int tvShowID) {
    return '$baseUrl/tv/$tvShowID?api_key=$apiKey&append_to_response=credits,reviews,similar';
  }

  static String getSeasonDetailsUrl(SeasonParams params) {
    return '$baseUrl/tv/${params.tvShowID}/season/${params.seasonNumber}?api_key=$apiKey';
  }

  static String getEpisodeDetailsUrl(EpisodeParams params) {
    return '$baseUrl/tv/${params.tvShowID}/season/${params.seasonNumber}/episode/${params.episodeNumber}?api_key=$apiKey&append_to_response=images,';
  }

  static String getAllTopRatedTvShowsUrl(int page) {
    return '$topRatedTvShows&page=$page';
  }

  static String getAllPopularTvShowsUrl(int page) {
    return '$popularTvShows&page=$page';
  }
}
