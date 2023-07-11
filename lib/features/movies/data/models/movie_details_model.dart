import 'package:movie_hub/core/helper/date_time_formatter.dart';
import 'package:movie_hub/core/helper/list_formatter.dart';
import 'package:movie_hub/core/helper/url_formatter.dart';
import 'package:movie_hub/core/helper/values_formatter.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/core/data/models/credits_model.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';

class MovieDetailsModel extends MediaDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.posterPath,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
    required super.voteCount,
    required super.trailerVideo,
    required super.credits,
    required super.reviews,
    required super.similar,
    required super.mediaType,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'],
      title: json['title'],
      runtime: ValuesFormatter.formatRuntime(json['runtime']),
      overview: json['overview'],
      voteCount: ValuesFormatter.formatVoteCount(json['vote_count']),
      releaseDate: DateTimeFormatter.formateDate(json['release_date']),
      voteAverage: double.parse(json['vote_average'].toStringAsFixed(1)),
      backdropPath: UrlFormatter.getBackdropUrl(json['backdrop_path']),
      trailerVideo: UrlFormatter.getTrailerUrl(json['videos']['results']),
      posterPath: UrlFormatter.getPosterUrl(json['poster_path']),
      genres: ListFormatter.getGenreList(json['genres']),
      credits: CreditsModel.fromJson(json['credits']),
      reviews: ListFormatter.getReviewList(json['reviews']['results']),
      similar: ListFormatter.getMovieList(json['similar']['results']),
      mediaType: MediaType.movie,
    );
  }
}
