import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_hub/core/helper/navigation_helpers.dart';
import 'package:movie_hub/features/movies/core/movies_routes.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/movies/presentation/view/movie_details._view.dart';
import 'package:movie_hub/features/movies/presentation/view/movies_view.dart';
import 'package:movie_hub/features/movies/presentation/view/now_playing_movies.dart';
import 'package:movie_hub/features/movies/presentation/view/popular_movies_view.dart';
import 'package:movie_hub/features/movies/presentation/view/top_rated_movies_view.dart';
import 'package:movie_hub/features/movies/presentation/view/upcoming_movies_view.dart';

class MoviesRouter {
  static List<RouteBase> get routes {
    return [
      GoRoute(
        name: MoviesRoutes.movies.name,
        path: MoviesRoutes.movies.path,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: MoviesView());
        },
        routes: [
          GoRoute(
            name: MoviesRoutes.movieDetails.name,
            path: MoviesRoutes.movieDetails.path,
            pageBuilder: (context, state) {
              return CupertinoPage(
                child: MovieDetailsView(
                  movieId: int.parse(state.pathParameters['movieId']!),
                ),
              );
            },
          ),
          GoRoute(
            path: MoviesRoutes.popularMovies.path,
            name: MoviesRoutes.popularMovies.name,
            pageBuilder: (context, state) {
              return const CupertinoPage(child: PopularMoviesView());
            },
          ),
          GoRoute(
            path: MoviesRoutes.topRatedMovies.path,
            name: MoviesRoutes.topRatedMovies.name,
            pageBuilder: (context, state) {
              return const CupertinoPage(child: TopRatedMoviesView());
            },
          ),
          GoRoute(
            path: MoviesRoutes.upcomingMovies.path,
            name: MoviesRoutes.upcomingMovies.name,
            pageBuilder: (context, state) {
              return const CupertinoPage(child: UpcomingMoviesView());
            },
          ),
          GoRoute(
            path: MoviesRoutes.nowPlayingMovies.path,
            name: MoviesRoutes.nowPlayingMovies.name,
            pageBuilder: (context, state) {
              final List<Media> nowPlayingMovies = state.extra as List<Media>;
              final int index = int.parse(state.pathParameters['index']!);
              return NavigationHelper.customTransitionPage(
                child: NowPlayingMoviesView(
                  index: index,
                  nowPlayingMovies: nowPlayingMovies,
                ),
              );
            },
          ),
        ],
      ),
    ];
  }
}
