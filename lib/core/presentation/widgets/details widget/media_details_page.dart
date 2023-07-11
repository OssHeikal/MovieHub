import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/helper/navigation_helpers.dart';
import 'package:movie_hub/core/presentation/widgets/cast/top_cast.dart';
import 'package:movie_hub/core/presentation/widgets/custom_button.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/overview_section.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/rating_row.dart';
import 'package:movie_hub/core/presentation/widgets/shimmer_image.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/strings.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';

class MediaDetailsPage extends StatelessWidget {
  MediaDetailsPage({
    super.key,
    required this.mediaDetails,
  });

  final MediaDetails mediaDetails;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return CupertinoScrollbar(
      controller: _scrollController,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              height: AppHeight.h230.h,
              child: Stack(
                children: [
                  ShimmerImage(
                    imageUrl: mediaDetails.backdropPath,
                    height: AppHeight.h175.h,
                  ),
                  Positioned(
                    top: AppHeight.h110.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: AppHeight.h60.h,
                      decoration:
                          BoxDecoration(gradient: AppGradient.primaryBottom),
                    ),
                  ),
                  _buildHeader(textTheme),
                ],
              ),
            ),
            OverviewSection(
              imageUrl: mediaDetails.posterPath,
              overview: mediaDetails.overview,
              title: mediaDetails.title,
              genres: mediaDetails.genres,
              borderRadius: AppSize.s6.r,
              showTrailingIcon: false,
            ),
            CustomButton(
              icon: Icons.add,
              height: AppHeight.h36.h,
              elevation: 0,
              centerTitle: true,
              color: AppColors.secondarySwatch.withOpacity(0.5),
              onPressed: () {},
              label: AppString.watchlist,
            ),
            SizedBox(height: AppHeight.h10.h),
            RatingRow(rating: mediaDetails.voteAverage),
            const Divider(),
            CustomButton(
              elevation: 0,
              centerTitle: true,
              height: AppHeight.h36.h,
              label: AppString.seeFullDetails,
              onPressed: () => NavigationHelper.navigateToMediaDetailsView(
                context,
                id: mediaDetails.id,
                mediaType: mediaDetails.mediaType,
              ),
            ),
            const Divider(),
            TopCastSection(cast: mediaDetails.credits.cast),
          ],
        ),
      ),
    );
  }

  Positioned _buildHeader(TextTheme textTheme) {
    return Positioned(
      top: AppHeight.h165.h,
      left: 0,
      right: 0,
      child: Container(
        height: AppHeight.h54.h,
        decoration: BoxDecoration(gradient: AppGradient.primaryTop),
        child: Container(
          margin: AppMargin.hMedium.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                mediaDetails.title,
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                AppString.getSubtitle(mediaDetails),
                style: textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
