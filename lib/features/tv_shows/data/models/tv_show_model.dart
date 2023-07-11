import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/core/helper/date_time_formatter.dart';
import 'package:movie_hub/core/helper/url_formatter.dart';
import 'package:movie_hub/core/utils/enums.dart';

class TvShowModel extends Media {
  const TvShowModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.backdropPath,
    required super.overview,
    required super.genres,
    required super.voteAverage,
    required super.releaseDate,
    required super.mediaType,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      id: json['id'],
      title: json['name'],
      genres: json['genre_ids'],
      overview: json['overview'],
      posterPath: UrlFormatter.getPosterUrl(json['poster_path']),
      releaseDate: DateTimeFormatter.formateDate(json['first_air_date']),
      voteAverage: double.parse(json['vote_average'].toStringAsFixed(1)),
      backdropPath: UrlFormatter.getBackdropUrl(json['backdrop_path']),
      mediaType: MediaType.tv,
    );
  }
}
