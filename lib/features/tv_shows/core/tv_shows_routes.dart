enum TvShowsRoutes {
  tvShows,
  tvShowDetails,
  onTheAirTvShows,
  popularTvShows,
  topRatedTvShows,
  seasonDetails,
  episodeDetails,
}

extension TvShowsRoutesX on TvShowsRoutes {
  String get name {
    switch (this) {
      case TvShowsRoutes.tvShows:
        return 'tvShows';
      case TvShowsRoutes.tvShowDetails:
        return 'tvShowDetails';
      case TvShowsRoutes.onTheAirTvShows:
        return 'onTheAirTvShows';
      case TvShowsRoutes.popularTvShows:
        return 'popularTvShows';
      case TvShowsRoutes.topRatedTvShows:
        return 'topRatedTvShows';
      case TvShowsRoutes.seasonDetails:
        return 'seasonDetails';
      case TvShowsRoutes.episodeDetails:
        return 'episodeDetails';
      default:
        return 'tvShows';
    }
  }

  String get path {
    switch (this) {
      case TvShowsRoutes.tvShows:
        return '/tv-shows';
      case TvShowsRoutes.onTheAirTvShows:
        return 'onTheAirTvShows/:index';
      case TvShowsRoutes.popularTvShows:
        return 'popularTvShows';
      case TvShowsRoutes.topRatedTvShows:
        return 'topRatedTvShows';
      case TvShowsRoutes.tvShowDetails:
        return 'tvShowDetails/:tvShowId';
      case TvShowsRoutes.seasonDetails:
        return 'seasonDetails/:index';
      case TvShowsRoutes.episodeDetails:
        return 'episodeDetails';
      default:
        return '/tv-shows';
    }
  }
}
