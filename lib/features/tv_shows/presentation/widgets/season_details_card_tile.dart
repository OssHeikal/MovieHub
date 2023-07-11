import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_hub/core/presentation/widgets/shimmer_image.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_routes.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/episode.dart';
import 'package:movie_hub/features/tv_shows/domain/usecases/get_episode_details_use_case.dart';

class SeasonDetailsCardTile extends StatelessWidget {
  const SeasonDetailsCardTile({
    super.key,
    required this.episode,
    required this.index,
  });

  final Episode episode;
  final int index;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        context.pushNamed(
          TvShowsRoutes.episodeDetails.name,
          pathParameters: {'index': '$index', 'tvShowId': '${episode.showId}'},
          extra: EpisodeParams(
            episode.showId,
            episode.seasonNumber,
            episode.episodeNumber,
          ),
        );
      },
      child: Container(
        padding: AppPadding.hMedium.w,
        color: AppColors.transparent,
        height: AppHeight.h140.h,
        child: Row(
          children: [
            ShimmerImage(
              imageUrl: episode.stillPath,
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
                        '$index. ${episode.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star,
                              color: AppColors.rating, size: AppSize.s14.sp),
                          SizedBox(width: AppWidth.w4.w),
                          Text(episode.voteAverage.toString(),
                              style: textTheme.bodyMedium),
                          SizedBox(width: AppWidth.w10.w),
                          Flexible(
                            child: Text(
                              '${episode.airDate}  ${episode.runtime}',
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    episode.overview,
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
