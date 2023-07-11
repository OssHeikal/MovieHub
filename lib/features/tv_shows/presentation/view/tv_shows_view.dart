import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/tv_shows/tv_shows_bloc.dart';
import 'package:movie_hub/features/tv_shows/presentation/widgets/tv_shows_widget.dart';

class TvShowsView extends StatelessWidget {
  const TvShowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TvShowsBloc>(
      create: (context) => sl<TvShowsBloc>()..add(AllTvShowsFetched()),
      child: Scaffold(
        body: BlocBuilder<TvShowsBloc, TvShowsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const Center(child: CustomLoadingIndicator());
              case RequestStatus.loaded:
                return TvShowsWidget(
                  onTheAirTvShows: state.tvShows[0],
                  popularTvShows: state.tvShows[1],
                  topRatedTvShows: state.tvShows[2],
                );
              case RequestStatus.error:
                return const Center(child: Text('Error'));
              default:
                return const Center(child: CustomLoadingIndicator());
            }
          },
        ),
      ),
    );
  }
}
