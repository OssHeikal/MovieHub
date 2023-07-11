import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/presentation/widgets/custom_app_bar.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/movies/presentation/controller/top_rated_movies/top_rated_movies_bloc.dart';
import 'package:movie_hub/features/movies/presentation/widgets/top_rated_movies_widget.dart';

class TopRatedMoviesView extends StatelessWidget {
  const TopRatedMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TopRatedMoviesBloc>(
      create: (context) =>
          sl<TopRatedMoviesBloc>()..add(AllTopRatedMoviesFetched()),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: const CustomAppBar(title: 'Popular Movies'),
        body: BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const CustomLoadingIndicator();
              case RequestStatus.loaded:
                return TopRatedMoviesWidget(topRatedMovies: state.movies);
              case RequestStatus.fetchMoreError:
                return TopRatedMoviesWidget(topRatedMovies: state.movies);
              case RequestStatus.error:
                return const Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
