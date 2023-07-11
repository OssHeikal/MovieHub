import 'package:movie_hub/core/helper/date_time_formatter.dart';
import 'package:movie_hub/core/helper/url_formatter.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/seaseon.dart';

class SeasonModel extends Season {
  const SeasonModel({
    required super.airDate,
    required super.episodeCount,
    required super.id,
    required super.name,
    required super.overview,
    required super.posterPath,
    required super.seasonNumber,
    required super.voteAverage,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
        airDate: DateTimeFormatter.formateDate(json['air_date']),
        episodeCount: json['episode_count'] as int,
        id: json['id'] as int,
        name: json['name'] as String,
        overview: json['overview'] as String,
        posterPath: UrlFormatter.getPosterUrl(json['poster_path']),
        seasonNumber: json['season_number'] as int,
        voteAverage: double.parse(json['vote_average'].toStringAsFixed(1)),
      );
}
