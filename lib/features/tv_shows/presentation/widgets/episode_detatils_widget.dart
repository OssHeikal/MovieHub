import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/cast/cast_footer.dart';
import 'package:movie_hub/core/presentation/widgets/cast/cast_tile.dart';
import 'package:movie_hub/core/presentation/widgets/custom_app_bar.dart';
import 'package:movie_hub/core/presentation/widgets/section_card.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/strings.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_strings.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/episode_details.dart';
import 'package:movie_hub/features/tv_shows/presentation/widgets/episode_details_card.dart';

class EpisodeDetailsWidget extends StatelessWidget {
  const EpisodeDetailsWidget({
    super.key,
    required this.episodeDetails,
  });

  final EpisodeDetails episodeDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: episodeDetails.name, height: AppHeight.h45),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildEpisodeTitle(context),
              const Divider(height: 0, thickness: 0.1),
              _buildEpisodeDetails(context),
              EpisodeDetailsCard(episodeDetails: episodeDetails),
              SizedBox(height: AppHeight.h20.h),
              _buildCastSection(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildEpisodeTitle(BuildContext context) {
    return Container(
      width: AppWidth.screenWidth(),
      color: AppColors.primary,
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p14.w,
        vertical: AppPadding.p12.h,
      ).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            episodeDetails.name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: AppFontSize.f24.sp),
          ),
          Text(
            TvShowsStrings.getEpisodeSubtitle(episodeDetails),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: AppFontSize.f13.sp),
          ),
        ],
      ),
    );
  }

  Container _buildEpisodeDetails(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.bodySmall!;
    return Container(
      width: AppWidth.screenWidth(),
      color: AppColors.primary,
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p14.w,
        vertical: AppPadding.p4.h,
      ).w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Season', style: textStyle),
              Text(episodeDetails.seasonNumber.toString(), style: textStyle),
            ],
          ),
          SizedBox(width: AppWidth.w10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Episode', style: textStyle),
              Text(episodeDetails.episodeNumber.toString(), style: textStyle),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: AppFontSize.f18.sp,
            color: AppColors.disabled,
          ),
        ],
      ),
    );
  }

  SectionCard _buildCastSection() {
    return SectionCard(
      height: AppHeight.h330,
      bottomPadding: 0,
      sectionTitle: AppString.cast,
      sectionFooter: CastFooter(
        producer: episodeDetails.writer,
        director: episodeDetails.director,
      ),
      itemCount: episodeDetails.guestStars.length,
      itemBuilder: (context, index) => CastTile(
        cast: episodeDetails.guestStars[index],
      ),
    );
  }
}
