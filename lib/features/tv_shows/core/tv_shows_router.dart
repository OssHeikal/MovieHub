import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/core/helper/navigation_helpers.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_routes.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/seaseon.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_episode_details_use_case.dart';
import 'package:movie_hub/features/tv_shows/presentation/view/episode_details_view.dart';
import 'package:movie_hub/features/tv_shows/presentation/view/on_the_air_tv_shows_view.dart';
import 'package:movie_hub/features/tv_shows/presentation/view/popular_tv_shows_view.dart';
import 'package:movie_hub/features/tv_shows/presentation/view/season_details_view.dart';
import 'package:movie_hub/features/tv_shows/presentation/view/top_rated_tv_show_view.dart';
import 'package:movie_hub/features/tv_shows/presentation/view/tv_show_details_view.dart';
import 'package:movie_hub/features/tv_shows/presentation/view/tv_shows_view.dart';

class TvShowsRouter {
  static List<RouteBase> get routes {
    return [
      GoRoute(
        name: TvShowsRoutes.tvShows.name,
        path: TvShowsRoutes.tvShows.path,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: TvShowsView());
        },
        routes: [
          GoRoute(
            name: TvShowsRoutes.tvShowDetails.name,
            path: TvShowsRoutes.tvShowDetails.path,
            pageBuilder: (context, state) {
              final int showId = int.parse(state.pathParameters['tvShowId']!);
              return CupertinoPage(child: TvShowDetailsView(showId: showId));
            },
            routes: [
              GoRoute(
                path: TvShowsRoutes.seasonDetails.path,
                name: TvShowsRoutes.seasonDetails.name,
                pageBuilder: (context, state) {
                  final seasons = state.extra as List<Season>;
                  final index = int.parse(state.pathParameters['index']!);
                  final showId = int.parse(state.pathParameters['tvShowId']!);
                  return NavigationHelper.customTransitionPage(
                    child: SeasonDetailsView(
                        index: index, showId: showId, seasons: seasons),
                  );
                },
                routes: [
                  GoRoute(
                    path: TvShowsRoutes.episodeDetails.path,
                    name: TvShowsRoutes.episodeDetails.name,
                    pageBuilder: (context, state) {
                      final episodeParams = state.extra as EpisodeParams;
                      // final index = int.parse(state.pathParameters['index']!);
                      return CupertinoPage(
                        child: EpisodeDetailsView(episodeParams: episodeParams),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: TvShowsRoutes.onTheAirTvShows.path,
            name: TvShowsRoutes.onTheAirTvShows.name,
            pageBuilder: (context, state) {
              final List<Media> onAirTvShows = state.extra as List<Media>;
              final int index = int.parse(state.pathParameters['index']!);
              return NavigationHelper.customTransitionPage(
                child: OnTheAirTvShowsView(index: index, tvShows: onAirTvShows),
              );
            },
          ),
          GoRoute(
            path: TvShowsRoutes.popularTvShows.path,
            name: TvShowsRoutes.popularTvShows.name,
            pageBuilder: (context, state) {
              return const CupertinoPage(child: PopularTvShowsView());
            },
          ),
          GoRoute(
            path: TvShowsRoutes.topRatedTvShows.path,
            name: TvShowsRoutes.topRatedTvShows.name,
            pageBuilder: (context, state) {
              return const CupertinoPage(child: TopRatedTvShowsView());
            },
          ),
        ],
      ),
    ];
  }
}
