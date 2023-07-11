import 'package:movie_hub/core/data/models/credits_model.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';
import 'package:movie_hub/core/helper/date_time_formatter.dart';
import 'package:movie_hub/core/helper/list_formatter.dart';
import 'package:movie_hub/core/helper/url_formatter.dart';
import 'package:movie_hub/core/helper/values_formatter.dart';
import 'package:movie_hub/core/utils/enums.dart';

class TvShowDetailsModel extends MediaDetails {
  const TvShowDetailsModel({
    required super.id,
    required super.title,
    required super.genres,
    required super.overview,
    required super.posterPath,
    required super.releaseDate,
    required super.voteAverage,
    required super.backdropPath,
    required super.mediaType,
    required super.voteCount,
    required super.credits,
    required super.reviews,
    required super.similar,
    required super.seasons,
    required super.numberOfEpisodes,
    required super.numberOfSeasons,
    required super.lastAirDate,
    required super.isAdded,
  });

  factory TvShowDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvShowDetailsModel(
      id: json['id'],
      title: json['name'],
      overview: json['overview'],
      voteCount: ValuesFormatter.formatVoteCount(json['vote_count']),
      releaseDate: DateTimeFormatter.formateDate(json['first_air_date']),
      voteAverage: double.parse(json['vote_average'].toStringAsFixed(1)),
      backdropPath: UrlFormatter.getBackdropUrl(json['backdrop_path']),
      posterPath: UrlFormatter.getPosterUrl(json['poster_path']),
      genres: ListFormatter.getGenreList(json['genres']),
      credits: CreditsModel.fromJson(json['credits']),
      reviews: ListFormatter.getReviewList(json['reviews']['results']),
      similar: ListFormatter.getTvShowsList(json['similar']['results']),
      mediaType: MediaType.tv,
      seasons: ListFormatter.getSeasonList(json['seasons']),
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons'],
      lastAirDate: json['last_air_date'],
      isAdded: false,
    );
  }
}
