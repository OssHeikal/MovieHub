import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_hub/core/presentation/view/home_view.dart';
import 'package:movie_hub/features/movies/core/movies_router.dart';
import 'package:movie_hub/features/movies/core/movies_routes.dart';
import 'package:movie_hub/features/search/core/search_router.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_router.dart';
import 'package:movie_hub/features/watchlist/core/watchlist_router.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  // static final GlobalKey<NavigatorState> _sectionANavigatorKey =
  //     GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: MoviesRoutes.movies.path,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomeView(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: MoviesRouter.routes),
          StatefulShellBranch(routes: TvShowsRouter.routes),
          StatefulShellBranch(routes: SearchRouter.routes),
          StatefulShellBranch(routes: WatchlistRouter.routes),
        ],
      )
    ],
  );


}
