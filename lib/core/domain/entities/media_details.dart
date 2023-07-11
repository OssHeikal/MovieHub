import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/core/domain/entities/credits.dart';
import 'package:movie_hub/core/domain/entities/genre.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/core/domain/entities/review.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/seaseon.dart';

class MediaDetails extends Equatable {
  final int id;
  final String backdropPath;
  final List<Genre> genres;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final String voteCount;
  final String? trailerVideo;
  final Credits credits;
  final List<Review> reviews;
  final List<Media> similar;
  final MediaType mediaType;
  final String? runtime;
  final String? lastAirDate;
  final int? numberOfSeasons;
  final int? numberOfEpisodes;
  final List<Season>? seasons;
  final bool isAdded;

  const MediaDetails({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    this.trailerVideo,
    required this.credits,
    required this.reviews,
    required this.similar,
    required this.mediaType,
    this.runtime,
    this.lastAirDate,
    this.numberOfSeasons,
    this.numberOfEpisodes,
    this.seasons,
    this.isAdded = false,
  });

  const MediaDetails.empty()
      : id = 0,
        backdropPath = '',
        genres = const [],
        overview = '',
        posterPath = '',
        releaseDate = '',
        runtime = '',
        title = '',
        voteAverage = 0.0,
        voteCount = '',
        trailerVideo = '',
        credits = const Credits.empty(),
        reviews = const [],
        similar = const [],
        mediaType = MediaType.movie,
        lastAirDate = '',
        numberOfSeasons = 0,
        numberOfEpisodes = 0,
        seasons = const [],
        isAdded = false;

  @override
  List<Object?> get props => [
        id,
        title,
        genres,
        reviews,
        similar,
        credits,
        runtime,
        overview,
        voteCount,
        posterPath,
        voteAverage,
        releaseDate,
        backdropPath,
        trailerVideo,
        mediaType,
        lastAirDate,
        numberOfSeasons,
        numberOfEpisodes,
        seasons,
        isAdded,
      ];
}
