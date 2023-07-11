import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/shimmer_image.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/cast.dart';

class CastTile extends StatelessWidget {
  const CastTile({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppWidth.w90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShimmerImage(
            imageUrl: cast.profilePath,
            height: AppHeight.h130.h,
          ),
          SizedBox(height: AppHeight.h10.h),
          Text(
            cast.name,
            maxLines: 2,
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            cast.character,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.1),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
