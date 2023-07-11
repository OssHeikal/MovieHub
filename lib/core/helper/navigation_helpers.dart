import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/movies/core/movies_routes.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_routes.dart';

class NavigationHelper {
  static void navigateToMediaDetailsView(
    BuildContext context, {
    required int id,
    required MediaType mediaType,
  }) {
    print(mediaType);
    if (mediaType == MediaType.movie) {
      context.pushNamed(
        MoviesRoutes.movieDetails.name,
        pathParameters: {'movieId': id.toString()},
      );
    } else {
      context.pushNamed(
        TvShowsRoutes.tvShowDetails.name,
        pathParameters: {'tvShowId': id.toString()},
      );
    }
  }

  static CustomTransitionPage<dynamic> customTransitionPage(
      {required Widget child}) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      child: child,
    );
  }
}
