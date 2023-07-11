import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_hub/core/presentation/widgets/media_title.dart';
import 'package:movie_hub/core/presentation/widgets/shimmer_image.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/utils/enums.dart';
import 'package:movie_hub/features/movies/core/movies_routes.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_routes.dart';

class MediaCardTile extends StatelessWidget {
  const MediaCardTile({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (media.mediaType == MediaType.movie) {
          context.pushNamed(
            MoviesRoutes.movieDetails.name,
            pathParameters: {'movieId': media.id.toString()},
          );
        } else {
          context.pushNamed(
            TvShowsRoutes.tvShowDetails.name,
            pathParameters: {'tvShowId': media.id.toString()},
          );
        }
      },
      child: SizedBox(
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
                imageUrl: media.posterPath,
                height: AppHeight.h190.h,
              ),
              MediaTitle(
                  title: media.title, rating: media.voteAverage.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
