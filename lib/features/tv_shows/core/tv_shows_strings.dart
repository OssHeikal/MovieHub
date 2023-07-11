import 'package:movie_hub/features/tv_shows/domain/entities/episode_details.dart';

class TvShowsStrings {
  static const String popularTvShows = 'Popular TV Shows';
  static const String topRatedTvShows = 'Top Rated TV Shows';
  static const String seasons = 'Seasons';
  static const String episodesGuide = 'Episodes Guide';
  static const String episodes = 'episodes';

  static String getEpisodeSubtitle(EpisodeDetails episodeDetails) {
    final String runtime = episodeDetails.runtime;
    final String airDate = episodeDetails.airDate;
    final String subtitle = 'TV Episode  $airDate  $runtime';
    return subtitle;
  }
}
