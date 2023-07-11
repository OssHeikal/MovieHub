import 'package:movie_hub/core/data/models/cast_model.dart';
import 'package:movie_hub/core/data/models/crew_model.dart';
import 'package:movie_hub/core/data/models/genre_model.dart';
import 'package:movie_hub/core/helper/url_formatter.dart';
import 'package:movie_hub/features/movies/data/models/movie_model.dart';
import 'package:movie_hub/core/data/models/review_model.dart';
import 'package:movie_hub/features/tv_shows/data/models/episode_model.dart';
import 'package:movie_hub/features/tv_shows/data/models/season_model.dart';
import 'package:movie_hub/features/tv_shows/data/models/tv_show_model.dart';

class ListFormatter {
  static List<MovieModel> getMovieList(List rawData) {
    return List<MovieModel>.from(rawData.map((e) => MovieModel.fromJson(e)));
  }

  static List<TvShowModel> getTvShowsList(List rawData) {
    return List<TvShowModel>.from(rawData.map((e) => TvShowModel.fromJson(e)));
  }

  static List<SeasonModel> getSeasonList(List rawData) {
    return List<SeasonModel>.from(rawData.map((e) => SeasonModel.fromJson(e)));
  }

  static List<EpisodeModel> getEpisodeList(List rawData) {
    return List<EpisodeModel>.from(
        rawData.map((e) => EpisodeModel.fromJson(e)));
  }

  static List<ReviewModel> getReviewList(List rawData) {
    return List<ReviewModel>.from(rawData.map((e) => ReviewModel.fromJson(e)));
  }

  static List<GenreModel> getGenreList(List rawData) {
    return List<GenreModel>.from(rawData.map((e) => GenreModel.fromJson(e)));
  }

  static List<CastModel> getCastList(List rawData) {
    return List<CastModel>.from(rawData.map((e) => CastModel.fromJson(e)));
  }

  static List<CrewModel> getCrewList(List rawData) {
    return List<CrewModel>.from(rawData.map((e) => CrewModel.fromJson(e)));
  }

  static String getDirectorName(List rawData) {
    return rawData.firstWhere(
          (e) => e['job'] == 'Director',
          orElse: () => {'name': null},
        )['name'] ??
        'N/A';
  }

  static String getWriterName(List rawData) {
    return rawData.firstWhere(
          (e) => e['job'] == 'Writer',
          orElse: () => {'name': null},
        )['name'] ??
        'N/A';
  }

  static String getProducerName(List rawData) {
    return rawData.firstWhere(
          (e) => e['job'] == 'Producer' || e['job'] == 'Executive Producer',
          orElse: () => {'name': null},
        )['name'] ??
        'N/A';
  }

  static List<String> getImagesPaths(List rawData) {
    return List<String>.from(
      rawData.map(
        (e) => UrlFormatter.getBackdropUrl(e['file_path'] as String),
      ),
    );
  }
}
