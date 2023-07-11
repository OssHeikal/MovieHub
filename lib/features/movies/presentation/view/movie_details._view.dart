import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_hub/features/movies/presentation/widgets/movie_details_widget.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieDetailsBloc>()..add(MovieDetailsFetched(movieId)),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const CustomLoadingIndicator();
              case RequestStatus.loaded:
                return MovieDetailsWidget(
                  movieDetails: state.movieDetails!,
                );
              case RequestStatus.error:
                return const Center(child: Text('Error'));

              default:
                return const CustomLoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
