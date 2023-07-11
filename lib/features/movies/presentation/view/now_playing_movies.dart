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
import 'package:movie_hub/features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/media_details_page.dart';

class NowPlayingMoviesView extends StatelessWidget {
  const NowPlayingMoviesView({
    super.key,
    required this.nowPlayingMovies,
    required this.index,
  });

  final List<Media> nowPlayingMovies;
  final int index;

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
        itemCount: nowPlayingMovies.length,
        itemBuilder: (context, index) => CustomPageTile(
          backgroundImagePath: nowPlayingMovies[index].posterPath,
          child: BlocProvider<MovieDetailsBloc>(
            create: (context) => sl<MovieDetailsBloc>()
              ..add(MovieDetailsFetched(nowPlayingMovies[index].id)),
            child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                switch (state.status) {
                  case RequestStatus.loading:
                    return const CustomLoadingIndicator();
                  case RequestStatus.loaded:
                    return MediaDetailsPage(mediaDetails: state.movieDetails!);
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
