import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/features/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movie_hub/features/movies/data/repository/movies_repository_impl.dart';
import 'package:movie_hub/features/movies/domain/repository/movies_repository.dart';
import 'package:movie_hub/features/movies/domain/usecases/get_all_popular_movies_usecase.dart';
import 'package:movie_hub/features/movies/domain/usecases/get_all_top_rated_movies_usecase.dart';
import 'package:movie_hub/features/movies/domain/usecases/get_all_upcoming_movies_usecase.dart';
import 'package:movie_hub/features/movies/domain/usecases/get_movie_details.dart';
import 'package:movie_hub/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:movie_hub/features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_hub/features/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movie_hub/features/movies/presentation/controller/popular_movies/popular_movies_bloc.dart';
import 'package:movie_hub/features/movies/presentation/controller/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:movie_hub/features/movies/presentation/controller/upcoming_movies/upcoming_movies_bloc.dart';

class MoviesDependencies {
  static void registerDependencies() {
    sl.registerLazySingleton<MoviesRemoteDatasource>(
        () => MoviesRemoteDatasourceImpl(sl()));

    // repositories
    sl.registerLazySingleton<MoviesRepository>(
        () => MoviesRepositoryImpl(sl()));

    // usecases
    sl.registerLazySingleton(() => GetMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetAllPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetAllUpcomingMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetAllTopRatedMoviesUsecase(sl()));

    // blocs
    sl.registerFactory(() => MoviesBloc(sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));
    sl.registerFactory(() => PopularMoviesBloc(sl()));
    sl.registerFactory(() => TopRatedMoviesBloc(sl()));
    sl.registerFactory(() => UpcomingMoviesBloc(sl()));
  }
}
