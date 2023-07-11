import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_hub/core/presentation/widgets/custom_action_button.dart';
import 'package:movie_hub/core/presentation/widgets/media_card_tile.dart';
import 'package:movie_hub/core/presentation/widgets/section_card.dart';
import 'package:movie_hub/core/presentation/widgets/slider%20widget/custom_slider.dart';
import 'package:movie_hub/core/presentation/widgets/slider%20widget/slider_card.dart';
import 'package:movie_hub/core/resources/strings.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/features/movies/core/movies_routes.dart';
import 'package:movie_hub/core/domain/entities/media.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({
    super.key,
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
  });
  final List<Media> nowPlayingMovies,
      popularMovies,
      topRatedMovies,
      upcomingMovies;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomSlider(
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return InkWell(
                    onTap: () => context.goNamed(
                        MoviesRoutes.nowPlayingMovies.name,
                        extra: nowPlayingMovies,
                        pathParameters: {'index': '$itemIndex'}),
                    child: SliderCard(media: nowPlayingMovies[itemIndex]));
              },
            ),
            SizedBox(height: AppHeight.h20.h),
            SectionCard(
              action: CustomActionButton(
                label: AppString.seeAll,
                onPressed: () =>
                    context.goNamed(MoviesRoutes.popularMovies.name),
              ),
              sectionTitle: AppString.popularMovies,
              itemCount: popularMovies.length,
              itemBuilder: (context, index) =>
                  MediaCardTile(media: popularMovies[index]),
            ),
            SizedBox(height: AppHeight.h20.h),
            SectionCard(
              action: CustomActionButton(
                label: AppString.seeAll,
                onPressed: () =>
                    context.goNamed(MoviesRoutes.topRatedMovies.name),
              ),
              sectionTitle: AppString.topRatedMovies,
              itemCount: topRatedMovies.length,
              itemBuilder: (context, index) =>
                  MediaCardTile(media: topRatedMovies[index]),
            ),
            SizedBox(height: AppHeight.h20.h),
            SectionCard(
              action: CustomActionButton(
                label: AppString.seeAll,
                onPressed: () =>
                    context.goNamed(MoviesRoutes.upcomingMovies.name),
              ),
              sectionTitle: AppString.upcomingMovies,
              itemCount: upcomingMovies.length,
              itemBuilder: (context, index) =>
                  MediaCardTile(media: upcomingMovies[index]),
            ),
          ],
        ),
      ),
    );
  }
}
