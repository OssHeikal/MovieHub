import 'package:go_router/go_router.dart';
import 'package:movie_hub/features/search/core/search_routes.dart';
import 'package:movie_hub/features/search/presentation/view/search_view.dart';

class SearchRouter {
  static List<RouteBase> get routes {
    return [
      GoRoute(
        name: SearchRoutes.search.name,
        path: SearchRoutes.search.path,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SearchView()),
      ),
    ];
  }
}
