import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/custom_button.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/overview_section.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/rating_row.dart';
import 'package:movie_hub/core/presentation/widgets/image_card.dart.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/strings.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';

class MediaDetailsCard extends StatelessWidget {
  const MediaDetailsCard({super.key, required this.mediaDetails});
  final MediaDetails mediaDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Column(
        children: [
          ImageCard(
              height: AppHeight.h260.h,
              imageUrl: mediaDetails.backdropPath,
              title: mediaDetails.title,
              subTitle: AppString.getSubtitle(mediaDetails)),
          SizedBox(height: AppHeight.h6.h),
          OverviewSection(
            imageUrl: mediaDetails.posterPath,
            overview: mediaDetails.overview,
            title: mediaDetails.title,
            genres: mediaDetails.genres,
          ),
          CustomButton(
            onPressed: () {},
            label: AppString.addWatchlist,
            icon: Icons.add,
          ),
          SizedBox(height: AppHeight.h6.h),
          const Divider(thickness: 0.1, height: 0),
          RatingRow(
            rating: mediaDetails.voteAverage,
            voteCount: mediaDetails.voteCount,
          ),
        ],
      ),
    );
  }
}
