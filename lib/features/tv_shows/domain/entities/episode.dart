import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  const Episode({
    required this.showId,
    required this.seasonNumber,
    required this.episodeNumber,
    required this.airDate,
    required this.name,
    required this.overview,
    required this.runtime,
    required this.stillPath,
    required this.voteAverage,
  });

  final int showId;
  final int seasonNumber;
  final int episodeNumber;
  final String airDate;
  final String name;
  final String overview;
  final String runtime;
  final String stillPath;
  final double voteAverage;

  @override
  List<Object?> get props => [
        airDate,
        name,
        overview,
        runtime,
        stillPath,
        voteAverage,
      ];
}
