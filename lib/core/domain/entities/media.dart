import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/utils/enums.dart';

class Media extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final List genres;
  final String backdropPath;
  final String releaseDate;
  final MediaType mediaType;

  const Media({
    required this.id,
    required this.title,
    required this.genres,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.backdropPath,
    required this.mediaType,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        genres,
        overview,
        posterPath,
        releaseDate,
        voteAverage,
        backdropPath,
        mediaType,
      ];
}

