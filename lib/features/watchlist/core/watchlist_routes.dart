enum WatchlistRoutes {
  watchlist,
}

extension WatchlistRoutesX on WatchlistRoutes {
  String get name {
    switch (this) {
      case WatchlistRoutes.watchlist:
        return 'watchlist';
      default:
        return 'watchlist';
    }
  }

  String get path {
    switch (this) {
      case WatchlistRoutes.watchlist:
        return '/watchlist';
      default:
        return '/watchlist';
    }
  }
}