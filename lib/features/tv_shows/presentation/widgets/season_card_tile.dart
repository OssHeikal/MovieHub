import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/media_title.dart';
import 'package:movie_hub/core/presentation/widgets/shimmer_image.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/seaseon.dart';

class SeasonCardTile extends StatelessWidget {
  const SeasonCardTile({
    super.key,
    required this.season,
  });

  final Season season;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppWidth.w130.w,
      child: Container(
        margin: EdgeInsets.only(bottom: AppPadding.p6.h).w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: AppSize.s4.r,
              blurRadius: AppSize.s10.sp,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerImage(
              imageUrl: season.posterPath,
              height: AppHeight.h190.h,
            ),
            MediaTitle(
                title: season.name, rating: season.voteAverage.toString()),
          ],
        ),
      ),
    );
  }
}
