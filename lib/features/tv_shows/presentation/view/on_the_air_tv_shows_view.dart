import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/core/presentation/widgets/custom_app_bar.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/presentation/widgets/custom_page_tile.dart';
import 'package:movie_hub/core/presentation/widgets/custom_page_view.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/strings.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/media_details_page.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/tv_show_details/tv_show_details_bloc.dart';

class OnTheAirTvShowsView extends StatelessWidget {
  const OnTheAirTvShowsView({
    super.key,
    required this.index,
    required this.tvShows,
  });

  final int index;
  final List<Media> tvShows;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: CustomAppBar(
        backgroundColor: AppColors.backgroundPrimary,
        title: AppString.upcomingMovies,
        height: AppHeight.h32.h,
      ),
      body: CustomPageView(
        index: index,
        itemCount: tvShows.length,
        itemBuilder: (context, index) => CustomPageTile(
          backgroundImagePath: tvShows[index].posterPath,
          child: BlocProvider<TvShowDetailsBloc>(
            create: (context) => sl<TvShowDetailsBloc>()
              ..add(TvShowDetailsFetched(tvShows[index].id)),
            child: BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
              builder: (context, state) {
                switch (state.status) {
                  case RequestStatus.loading:
                    return const CustomLoadingIndicator();
                  case RequestStatus.loaded:
                    return MediaDetailsPage(mediaDetails: state.tvShowDetails);
                  default:
                    return const CustomLoadingIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
