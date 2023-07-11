import 'package:movie_hub/core/helper/date_time_formatter.dart';
import 'package:movie_hub/core/helper/url_formatter.dart';
import 'package:movie_hub/core/helper/values_formatter.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/episode.dart';

class EpisodeModel extends Episode {
  const EpisodeModel({
    required super.showId,
    required super.airDate,
    required super.episodeNumber,
    required super.name,
    required super.overview,
    required super.runtime,
    required super.seasonNumber,
    required super.stillPath,
    required super.voteAverage,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        showId: json['show_id'] as int,
        seasonNumber: json['season_number'] as int,
        episodeNumber: json['episode_number'] as int,
        airDate: DateTimeFormatter.formateDate(json['air_date']),
        name: json['name'] as String,
        overview: json['overview'] as String,
        runtime: ValuesFormatter.formatRuntime(json['runtime']),
        voteAverage: double.parse(json['vote_average'].toStringAsFixed(1)),
        stillPath: UrlFormatter.getStillUrl(json['still_path']),
      );
}
