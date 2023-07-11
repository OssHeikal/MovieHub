import 'package:movie_hub/core/helper/date_time_formatter.dart';
import 'package:movie_hub/core/helper/url_formatter.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/core/domain/entities/media.dart';

class MovieModel extends Media {
  const MovieModel({
    required super.id,
    required super.title,
    required super.genres,
    required super.overview,
    required super.posterPath,
    required super.releaseDate,
    required super.voteAverage,
    required super.backdropPath,
    required super.mediaType,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      genres: json['genre_ids'],
      overview: json['overview'],
      posterPath: UrlFormatter.getPosterUrl(json['poster_path']),
      releaseDate: DateTimeFormatter.formateDate(json['release_date']),
      voteAverage: double.parse(json['vote_average'].toStringAsFixed(1)),
      backdropPath: UrlFormatter.getBackdropUrl(json['backdrop_path']),
      mediaType: MediaType.movie,
    );
  }
}
