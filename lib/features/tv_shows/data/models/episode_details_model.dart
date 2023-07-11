import 'package:movie_hub/core/helper/date_time_formatter.dart';
import 'package:movie_hub/core/helper/list_formatter.dart';
import 'package:movie_hub/core/helper/url_formatter.dart';
import 'package:movie_hub/core/helper/values_formatter.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/episode_details.dart';

class EpisodeDetailsModel extends EpisodeDetails {
  const EpisodeDetailsModel({
    required super.airDate,
    required super.episodeNumber,
    required super.name,
    required super.overview,
    required super.seasonNumber,
    required super.stillPath,
    required super.voteAverage,
    required super.voteCount,
    required super.runtime,
    required super.director,
    required super.writer,
    required super.guestStars,
    required super.imagesPaths,
  });

  factory EpisodeDetailsModel.fromJson(Map<String, dynamic> json) =>
      EpisodeDetailsModel(
        seasonNumber: json['season_number'] as int,
        episodeNumber: json['episode_number'] as int,
        airDate: DateTimeFormatter.formateDate(json['air_date']),
        name: json['name'] as String,
        overview: json['overview'] as String,
        runtime: ValuesFormatter.formatRuntime(json['runtime']),
        stillPath: UrlFormatter.getStillUrl(json['still_path']),
        voteAverage: double.parse(json['vote_average'].toStringAsFixed(1)),
        voteCount: ValuesFormatter.formatVoteCount(json['vote_count']),
        director: ListFormatter.getDirectorName(json['crew'] as List),
        writer: ListFormatter.getWriterName(json['crew'] as List),
        guestStars: ListFormatter.getCastList(json['guest_stars'] as List),
        imagesPaths:
            ListFormatter.getImagesPaths(json['images']['stills'] as List),
      );
}
