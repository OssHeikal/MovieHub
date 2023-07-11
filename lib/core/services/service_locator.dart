import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_hub/core/data/network/network_connection.dart';
import 'package:movie_hub/core/services/api_services.dart';
import 'package:movie_hub/features/movies/core/movies_dependencies.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_dependencies.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerFactory<Dio>(() => Dio());
    sl.registerLazySingleton<NetworkConnection>(() => NetworkConnection());
    sl.registerLazySingleton<ApiService>(() => ApiService(sl(), sl()));

    MoviesDependencies.registerDependencies();
    TvShowsDependencies.registerDependencies();
  }
}
