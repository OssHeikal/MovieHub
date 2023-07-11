import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_episode_details_use_case.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/episode_details/episode_details_bloc.dart';
import 'package:movie_hub/features/tv_shows/presentation/widgets/episode_detatils_widget.dart';

class EpisodeDetailsView extends StatelessWidget {
  const EpisodeDetailsView({
    super.key,
    required this.episodeParams,
  });

  final EpisodeParams episodeParams;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<EpisodeDetailsBloc>()..add(EpisodeDetailsFetched(episodeParams)),
      child: Scaffold(
        body: BlocBuilder<EpisodeDetailsBloc, EpisodeDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const CustomLoadingIndicator();
              case RequestStatus.loaded:
                return EpisodeDetailsWidget(
                  episodeDetails: state.episodeDetails,
                );
              default:
                return const Center(child: CustomLoadingIndicator());
            }
          },
        ),
      ),
    );
  }
}
