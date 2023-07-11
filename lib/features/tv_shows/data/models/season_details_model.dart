import 'package:movie_hub/core/helper/date_time_formatter.dart';
import 'package:movie_hub/core/helper/list_formatter.dart';
import 'package:movie_hub/core/helper/url_formatter.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/season_details.dart';

class SeasonDetailsModel extends SeasonDetails {
  const SeasonDetailsModel({
    required super.name,
    required super.airData,
    required super.episodes,
    required super.overview,
    required super.posterPath,
    required super.seasonNumber,
  });

  factory SeasonDetailsModel.fromJson(Map<String, dynamic> json) =>
      SeasonDetailsModel(
        name: json['name'] as String,
        airData: DateTimeFormatter.formateDate(json['air_date']),
        overview: json['overview'] as String,
        seasonNumber: json['season_number'] as int,
        episodes: ListFormatter.getEpisodeList(json['episodes'] as List),
        posterPath: UrlFormatter.getPosterUrl(json['poster_path']),
      );
}
