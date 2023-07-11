import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/presentation/widgets/custom_app_bar.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/movies/presentation/controller/popular_movies/popular_movies_bloc.dart';
import 'package:movie_hub/features/movies/presentation/widgets/popular_movies_widget.dart';

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularMoviesBloc>(
      create: (context) =>
          sl<PopularMoviesBloc>()..add(AllPopularMoviesFetched()),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: const CustomAppBar(title: 'Popular Movies'),
        body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const CustomLoadingIndicator();
              case RequestStatus.loaded:
                return PopularMoviesWidget(popularMovies: state.movies);
              case RequestStatus.fetchMoreError:
                return PopularMoviesWidget(popularMovies: state.movies);
              case RequestStatus.error:
                return const Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
