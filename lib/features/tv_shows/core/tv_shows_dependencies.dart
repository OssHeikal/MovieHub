import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/features/tv_shows/data/datasource/tv_shows_remote_data_source.dart';
import 'package:movie_hub/features/tv_shows/data/repository/tv_shows_repository_impl.dart';
import 'package:movie_hub/features/tv_shows/domain/repository/tv_shows_repository.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_all_popular_tv_shows_use_case.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_all_top_rated_tv_shows_use_case.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_episode_details_use_case.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_season_details_use_case.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_tv_show_details_use_case.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_tv_shows_use_case.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/episode_details/episode_details_bloc.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/popular_tv_shows/popular_tv_shows_bloc.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/season_details/season_details_bloc.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/top_rated_tv_shows/top_rated_tv_shows_bloc.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/tv_show_details/tv_show_details_bloc.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/tv_shows/tv_shows_bloc.dart';

class TvShowsDependencies {
  static void registerDependencies() {
    // Data Sources
    sl.registerLazySingleton<TvShowsRemoteDataSource>(
        () => TvShowsRemoteDataSourceImpl(sl()));

    // Repositories
    sl.registerLazySingleton<TvShowsRepository>(
        () => TvShowsRepositoryImpl(sl()));

    // Use Cases
    sl.registerLazySingleton(() => GetTvShowsUseCase(sl()));
    sl.registerLazySingleton(() => GetAllPopularTvShowsUseCase(sl()));
    sl.registerLazySingleton(() => GetAllTopRatedTvShowsUseCase(sl()));
    sl.registerLazySingleton(() => GetTvShowDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetSeasonDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetEpisodeDetailsUseCase(sl()));

    // Blocs
    sl.registerFactory(() => TvShowsBloc(sl()));
    sl.registerFactory(() => TvShowDetailsBloc(sl()));
    sl.registerFactory(() => SeasonDetailsBloc(sl()));
    sl.registerFactory(() => EpisodeDetailsBloc(sl()));
    sl.registerFactory(() => PopularTvShowsBloc(sl()));
    sl.registerFactory(() => TopRatedTvShowsBloc(sl()));
  }
}
