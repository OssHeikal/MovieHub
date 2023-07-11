import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';
import 'package:movie_hub/features/movies/domain/usecases/get_movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase _getMovieDeatialsUsecase;
  MovieDetailsBloc(this._getMovieDeatialsUsecase)
      : super(const MovieDetailsState()) {
    on<MovieDetailsFetched>(_getMovieDetails);
  }

  Future<FutureOr<void>> _getMovieDetails(
      MovieDetailsFetched event, Emitter<MovieDetailsState> emit) async {
    emit(state.copyWith(status: RequestStatus.loading));
    final result = await _getMovieDeatialsUsecase(event.movieId);
    result.fold(
      (error) => emit(state.copyWith(status: RequestStatus.error)),
      (movieDetails) {
        emit(state.copyWith(
            status: RequestStatus.loaded, movieDetails: movieDetails));
      },
    );
  }
}
