enum MoviesRoutes {
  movies,
  movieDetails,
  popularMovies,
  topRatedMovies,
  upcomingMovies,
  nowPlayingMovies,
}

extension MoviesRoutesExtension on MoviesRoutes {
  String get name {
    switch (this) {
      case MoviesRoutes.movies:
        return 'movies';
      case MoviesRoutes.movieDetails:
        return 'movieDetails';
      case MoviesRoutes.popularMovies:
        return 'popularMovies';
      case MoviesRoutes.topRatedMovies:
        return 'topRatedMovies';
      case MoviesRoutes.upcomingMovies:
        return 'upcomingMovies';
      case MoviesRoutes.nowPlayingMovies:
        return 'nowPlayingMovies';
    }
  }

  String get path {
    switch (this) {
      case MoviesRoutes.movies:
        return '/movies';
      case MoviesRoutes.movieDetails:
        return 'movieDetails/:movieId';
      case MoviesRoutes.popularMovies:
        return 'popularMovies';
      case MoviesRoutes.topRatedMovies:
        return 'topRatedMovies';
      case MoviesRoutes.upcomingMovies:
        return 'upcomingMovies';
      case MoviesRoutes.nowPlayingMovies:
        return 'nowPlayingMovies/:index';
    }
  }
}
