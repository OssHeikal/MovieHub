import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/domain/entities/cast.dart';

class EpisodeDetails extends Equatable {
  const EpisodeDetails({
    required this.seasonNumber,
    required this.episodeNumber,
    required this.airDate,
    required this.name,
    required this.overview,
    required this.runtime,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
    required this.director,
    required this.writer,
    required this.guestStars,
    required this.imagesPaths,
  });

  final int seasonNumber;
  final int episodeNumber;
  final String airDate;
  final String name;
  final String overview;
  final String runtime;
  final String stillPath;
  final double voteAverage;
  final String voteCount;
  final String director;
  final String writer;
  final List<Cast> guestStars;
  final List<String> imagesPaths;

  const EpisodeDetails.empty()
      : seasonNumber = 0,
        episodeNumber = 0,
        airDate = '',
        name = '',
        overview = '',
        runtime = '',
        stillPath = '',
        voteAverage = 0,
        voteCount = '',
        director = '',
        writer = '',
        guestStars = const [],
        imagesPaths = const [];

  @override
  List<Object?> get props => [
        seasonNumber,
        episodeNumber,
        airDate,
        name,
        overview,
        runtime,
        stillPath,
        voteAverage,
        voteCount,
        director,
      ];
}
