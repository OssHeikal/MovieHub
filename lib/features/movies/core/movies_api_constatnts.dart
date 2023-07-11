import 'package:movie_hub/core/data/network/api_constants.dart';

class MoviesApiConstatnts {
  static const String baseUrl = ApiConstants.baseUrl;
  static const String apiKey = ApiConstants.apiKey;

  static const String nowPlayingMovies =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMovies = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMovies =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String upcomingMovies =
      '$baseUrl/movie/upcoming?api_key=$apiKey';

  static String getMovieDetailsUrl(int movieID) {
    return '$baseUrl/movie/$movieID?api_key=$apiKey&append_to_response=videos,credits,reviews,similar';
  }

  static String getAllTopRattedMoviesUrl(int page) {
    return '$topRatedMovies&page=$page';
  }

  static String getAllPopularMoviesUrl(int page) {
    return '$popularMovies&page=$page';
  }

  static String getAllUpcomingMoviesUrl(int page) {
    return '$upcomingMovies&page=$page';
  }
}
