import 'package:go_router/go_router.dart';
import 'package:movie_hub/features/watchlist/core/watchlist_routes.dart';
import 'package:movie_hub/features/watchlist/presentation/view/watchlist_view.dart';

class WatchlistRouter {
  static List<RouteBase> get routes {
    return [
      GoRoute(
        name: WatchlistRoutes.watchlist.name,
        path: WatchlistRoutes.watchlist.path,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: WatchlistView());
        },
      ),
    ];
  }
}
