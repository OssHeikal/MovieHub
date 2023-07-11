import 'package:equatable/equatable.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/episode.dart';

class SeasonDetails extends Equatable {
  const SeasonDetails({
    required this.airData,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
  });

  final String airData;
  final List<Episode> episodes;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;

  const SeasonDetails.empty()
      : airData = '',
        episodes = const [],
        name = '',
        overview = '',
        posterPath = '',
        seasonNumber = 0;

  @override
  List<Object?> get props => [
        airData,
        episodes,
        name,
        overview,
        posterPath,
        seasonNumber,
      ];
}
