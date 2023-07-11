import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/custom_button.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/overview_section.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/rating_row.dart';
import 'package:movie_hub/core/presentation/widgets/shimmer_image.dart';
import 'package:movie_hub/core/presentation/widgets/slider%20widget/custom_slider.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/strings.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/episode_details.dart';

class EpisodeDetailsCard extends StatelessWidget {
  const EpisodeDetailsCard({super.key, required this.episodeDetails});
  final EpisodeDetails episodeDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Column(
        children: [
          CustomSlider(
            height: AppHeight.h210,
            itemCount: episodeDetails.imagesPaths.length,
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return _buildImageCardTile(itemIndex);
            },
          ),
          OverviewSection(
            imageUrl: episodeDetails.stillPath,
            overview: episodeDetails.overview,
            title: episodeDetails.name,
          ),
          CustomButton(
            onPressed: () {},
            label: AppString.addWatchlist,
            icon: Icons.add,
          ),
          SizedBox(height: AppHeight.h6.h),
          const Divider(thickness: 0.1, height: 0),
          RatingRow(
            rating: episodeDetails.voteAverage,
            voteCount: episodeDetails.voteCount,
          ),
        ],
      ),
    );
  }

  Stack _buildImageCardTile(int itemIndex) {
    return Stack(
      children: [
        ShimmerImage(
          height: AppHeight.h200,
          imageUrl: episodeDetails.imagesPaths[itemIndex],
        ),
        Positioned(
          child: Container(
            height: AppHeight.h200,
            decoration: BoxDecoration(gradient: AppGradient.secondaryBottom),
          ),
        ),
      ],
    );
  }
}
