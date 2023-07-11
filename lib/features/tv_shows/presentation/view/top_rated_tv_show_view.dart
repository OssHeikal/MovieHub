import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/presentation/widgets/custom_app_bar.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_strings.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/top_rated_tv_shows/top_rated_tv_shows_bloc.dart';
import 'package:movie_hub/features/tv_shows/presentation/widgets/top_rated_tv_shows_widget.dart';

class TopRatedTvShowsView extends StatelessWidget {
  const TopRatedTvShowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TopRatedTvShowsBloc>()..add(AllTopRatedTvShowsFetched()),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: const CustomAppBar(title: TvShowsStrings.topRatedTvShows),
        body: BlocBuilder<TopRatedTvShowsBloc, TopRatedTvShowsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const CustomLoadingIndicator();
              case RequestStatus.loaded:
                return TopRatedTvShowsWidget(
                    topRatedTvShows: state.topRatedTvShows);
              default:
                return const Center(child: Text('Something went wrong'));
            }
          },
        ),
      ),
    );
  }
}
