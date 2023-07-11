import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/helper/navigation_helpers.dart';
import 'package:movie_hub/core/presentation/widgets/shimmer_image.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/media.dart';

class DetailsCardTile extends StatelessWidget {
  const DetailsCardTile({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () => NavigationHelper.navigateToMediaDetailsView(
        context,
        id: media.id,
        mediaType: media.mediaType,
      ),
      child: Container(
        padding: AppPadding.hMedium.w,
        color: AppColors.primary,
        height: AppHeight.h140.h,
        child: Row(
          children: [
            ShimmerImage(
              imageUrl: media.posterPath,
              height: AppHeight.h120.h,
              width: AppWidth.w80.w,
            ),
            SizedBox(width: AppWidth.w10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        media.title,
                        style: textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star,
                              color: AppColors.rating, size: AppSize.s14.sp),
                          SizedBox(width: AppWidth.w4.w),
                          Text(media.voteAverage.toString(),
                              style: textTheme.bodyLarge),
                          SizedBox(width: AppWidth.w10.w),
                          Text(
                            media.releaseDate,
                            style: textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    media.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: Icon(
                Icons.info_outline,
                size: AppSize.s20.sp,
                color: AppColors.divider,
              ),
            )
          ],
        ),
      ),
    );
  }
}
