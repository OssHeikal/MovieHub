import 'package:movie_hub/core/domain/entities/media_details.dart';

class AppString {
  static const String popularMovies = 'Popular Movies';
  static const String topRatedMovies = 'Top Rated Movies';
  static const String upcomingMovies = 'Upcoming Movies';
  static const String seeAll = 'See All';
  static const String moreLikeThis = 'More like this';
  static const String cast = 'Cast';
  static const String topCast = 'Top Cast';
  static const String watchlist = 'Watchlist';
  static const String addWatchlist = 'Add to Watchlist';
  static const String removeWatchlist = 'Remove from Watchlist';
  static const String director = 'Director:  ';
  static const String producer = 'Producer:  ';
  static const String review = 'Reviews';
  static const String noReview = 'No reviews yet';
  static const String seeFullDetails = 'See full details';

  static String getSubtitle(MediaDetails movieDetails) {
    String runtime = movieDetails.runtime ?? 'Tv-Show';
    String genre = '';
    String releaseYear = '';

    String subtitle = '';

    if (movieDetails.genres.isNotEmpty) {
      genre = movieDetails.genres.first.name;
    }

    if (movieDetails.releaseDate.isNotEmpty) {
      releaseYear = movieDetails.releaseDate.split(',').last.trim();
    }

    if (releaseYear.isNotEmpty) {
      subtitle += releaseYear;
    }

    if (genre.isNotEmpty) {
      if (subtitle.isNotEmpty) {
        subtitle += '  \u2022  ';
      }
      subtitle += genre;
    }

    if (runtime.isNotEmpty) {
      if (subtitle.isNotEmpty) {
        subtitle += '  \u2022  ';
      }
      subtitle += runtime;
    }

    return subtitle; // 2023  .  Action  .  2h 24m
  }
}
