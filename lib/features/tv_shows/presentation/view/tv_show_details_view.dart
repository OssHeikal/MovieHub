import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/tv_show_details/tv_show_details_bloc.dart';
import 'package:movie_hub/features/tv_shows/presentation/widgets/tv_show_details_widget.dart';

class TvShowDetailsView extends StatelessWidget {
  const TvShowDetailsView({super.key, required this.showId});

  final int showId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TvShowDetailsBloc>(
      create: (context) =>
          sl<TvShowDetailsBloc>()..add(TvShowDetailsFetched(showId)),
      child: Scaffold(
        body: BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const CustomLoadingIndicator();
              case RequestStatus.loaded:
                return TvShowDetailsWidget(tvShowDetails: state.tvShowDetails);
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
