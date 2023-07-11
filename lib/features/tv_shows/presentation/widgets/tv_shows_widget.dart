import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/core/presentation/widgets/custom_action_button.dart';
import 'package:movie_hub/core/presentation/widgets/media_card_tile.dart';
import 'package:movie_hub/core/presentation/widgets/section_card.dart';
import 'package:movie_hub/core/presentation/widgets/slider%20widget/custom_slider.dart';
import 'package:movie_hub/core/presentation/widgets/slider%20widget/slider_card.dart';
import 'package:movie_hub/core/resources/strings.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_routes.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_strings.dart';

class TvShowsWidget extends StatelessWidget {
  const TvShowsWidget({
    super.key,
    required this.onTheAirTvShows,
    required this.popularTvShows,
    required this.topRatedTvShows,
  });

  final List<Media> onTheAirTvShows;
  final List<Media> popularTvShows;
  final List<Media> topRatedTvShows;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildOnTheAirSlider(),
            SizedBox(height: AppHeight.h20.h),
            _buildPopularSection(context),
            SizedBox(height: AppHeight.h20.h),
            _buildTopRatedSection(context),
          ],
        ),
      ),
    );
  }

  CustomSlider _buildOnTheAirSlider() {
    return CustomSlider(
      itemBuilder: (context, itemIndex, pageViewIndex) {
        return InkWell(
          child: SliderCard(media: onTheAirTvShows[itemIndex]),
          onTap: () => context.goNamed(
            TvShowsRoutes.onTheAirTvShows.name,
            extra: onTheAirTvShows,
            pathParameters: {'index': '$itemIndex'},
          ),
        );
      },
    );
  }

  SectionCard _buildPopularSection(BuildContext context) {
    return SectionCard(
      sectionTitle: TvShowsStrings.popularTvShows,
      itemCount: popularTvShows.length,
      itemBuilder: (_, index) {
        return MediaCardTile(media: popularTvShows[index]);
      },
      action: CustomActionButton(
        label: AppString.seeAll,
        onPressed: () => context.goNamed(TvShowsRoutes.popularTvShows.name),
      ),
    );
  }

  SectionCard _buildTopRatedSection(BuildContext context) {
    return SectionCard(
      sectionTitle: TvShowsStrings.topRatedTvShows,
      itemCount: topRatedTvShows.length,
      itemBuilder: (_, index) {
        return MediaCardTile(media: topRatedTvShows[index]);
      },
      action: CustomActionButton(
        label: AppString.seeAll,
        onPressed: () => context.goNamed(TvShowsRoutes.topRatedTvShows.name),
      ),
    );
  }
}
