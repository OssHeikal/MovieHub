import 'package:movie_hub/core/data/errors/exceptions.dart';
import 'package:movie_hub/core/helper/list_formatter.dart';
import 'package:movie_hub/core/services/api_services.dart';
import 'package:movie_hub/features/movies/core/movies_api_constatnts.dart';
import 'package:movie_hub/features/movies/data/models/movie_details_model.dart';
import 'package:movie_hub/features/movies/data/models/movie_model.dart';

abstract class MoviesRemoteDatasource {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> getUpcomingMovies();
  Future<List<List<MovieModel>>> getAllMovies();
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getAllPopularMovies(int page);
  Future<List<MovieModel>> getAllTopRatedMovies(int page);
  Future<List<MovieModel>> getAllUpcomingMovies(int page);
  Future<MovieDetailsModel> getMovieDetails(int movieId);
}

class MoviesRemoteDatasourceImpl implements MoviesRemoteDatasource {
  MoviesRemoteDatasourceImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<List<List<MovieModel>>> getAllMovies() async {
    return await Future.wait(
      [
        getNowPlayingMovies(),
        getPopularMovies(),
        getTopRatedMovies(),
        getUpcomingMovies(),
      ],
    );
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    return await fetchMovies(MoviesApiConstatnts.popularMovies);
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    return await fetchMovies(MoviesApiConstatnts.topRatedMovies);
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    return await fetchMovies(MoviesApiConstatnts.upcomingMovies);
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    return await fetchMovies(MoviesApiConstatnts.nowPlayingMovies);
  }

  @override
  Future<List<MovieModel>> getAllTopRatedMovies(int page) async {
    return await fetchMovies(
        MoviesApiConstatnts.getAllTopRattedMoviesUrl(page));
  }

  @override
  Future<List<MovieModel>> getAllUpcomingMovies(int page) async {
    return await fetchMovies(MoviesApiConstatnts.getAllUpcomingMoviesUrl(page));
  }

  @override
  Future<List<MovieModel>> getAllPopularMovies(int page) async {
    return await fetchMovies(MoviesApiConstatnts.getAllPopularMoviesUrl(page));
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    return await fetchMovieDetails(movieId);
  }

  Future<List<MovieModel>> fetchMovies(String endpoint) async {
    try {
      final response = await apiService.getData(endpoint);
      return ListFormatter.getMovieList(response.data['results']);
    } on NoInternetException catch (_) {
      rethrow;
    } on ServerException catch (_) {
      rethrow;
    } catch (e) {
      throw UnexpectedException();
    }
  }

  Future<MovieDetailsModel> fetchMovieDetails(int movieId) async {
    try {
      final response = await apiService
          .getData(MoviesApiConstatnts.getMovieDetailsUrl(movieId));
      if (response.statusCode == 200) {
        return MovieDetailsModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw UnexpectedException();
    }
  }
}
