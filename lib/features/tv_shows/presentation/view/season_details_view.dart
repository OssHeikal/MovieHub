import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_hub/core/presentation/widgets/custom_app_bar.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/presentation/widgets/custom_page_tile.dart';
import 'package:movie_hub/core/presentation/widgets/custom_page_view.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/services/service_locator.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_strings.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/seaseon.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_season_details_use_case.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/season_details/season_details_bloc.dart';
import 'package:movie_hub/features/tv_shows/presentation/widgets/season_details_widget.dart';

class SeasonDetailsView extends StatelessWidget {
  const SeasonDetailsView({
    super.key,
    required this.index,
    required this.showId,
    required this.seasons,
  });

  final int index;
  final int showId;
  final List<Season> seasons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: CustomAppBar(
        backgroundColor: AppColors.backgroundPrimary,
        title: TvShowsStrings.episodesGuide,
        height: AppHeight.h32.h,
      ),
      body: CustomPageView(
        index: index,
        itemCount: seasons.length,
        itemBuilder: (context, index) {
          final season = seasons[index];
          return CustomPageTile(
            backgroundImagePath: season.posterPath,
            child: BlocProvider<SeasonDetailsBloc>(
              create: (context) {
                final int seasonNumber = season.seasonNumber;
                return sl<SeasonDetailsBloc>()
                  ..add(
                    SeasonDetailsFetched(
                      SeasonParams(showId, seasonNumber),
                    ),
                  );
              },
              child: BlocBuilder<SeasonDetailsBloc, SeasonDetailsState>(
                builder: (context, state) {
                  switch (state.status) {
                    case RequestStatus.loading:
                      return const CustomLoadingIndicator();
                    case RequestStatus.loaded:
                      return SeasonDetailsWidget(
                          seasonDetails: state.seasonDetails);
                    default:
                      return const CustomLoadingIndicator();
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
