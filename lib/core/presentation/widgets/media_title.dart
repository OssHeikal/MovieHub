import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';

class MediaTitle extends StatelessWidget {
  const MediaTitle({
    super.key,
    required this.title,
    required this.rating,
  });

  final String title;
  final String rating;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Flexible(
      child: Container(
        padding: AppPadding.small,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, size: AppSize.s12.sp, color: AppColors.rating),
                SizedBox(width: AppWidth.w6.w),
                Text(rating, style: textTheme.bodySmall),
              ],
            ),
            SizedBox(height: AppHeight.h1.h),
            Text(
              title,
              style: textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
