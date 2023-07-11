import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/presentation/widgets/custom_app_bar.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/movies/presentation/controller/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:movie_hub/features/movies/presentation/widgets/upcoming_movies.dart';

class UpcomingMoviesView extends StatelessWidget {
  const UpcomingMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpcomingMoviesBloc>(
      create: (context) =>
          sl<UpcomingMoviesBloc>()..add(AllUpcomingMoviesFetched()),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: const CustomAppBar(title: 'Popular Movies'),
        body: BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const CustomLoadingIndicator();
              case RequestStatus.loaded:
                return UpcomingMoviesWidget(upcomingMovies: state.movies);
              case RequestStatus.fetchMoreError:
                return UpcomingMoviesWidget(upcomingMovies: state.movies);
              case RequestStatus.error:
                return const Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
