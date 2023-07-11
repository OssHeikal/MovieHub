import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.rating,
    this.voteCount,
  });
  final double rating;
  final String? voteCount;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: AppMargin.vSmall,
          child: Row(
            children: [
              Icon(Icons.star, color: AppColors.rating, size: AppSize.s24.sp),
              SizedBox(width: AppWidth.w8.w),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: '$rating', style: textTheme.titleMedium),
                        TextSpan(text: '/10', style: textTheme.titleSmall),
                      ],
                    ),
                  ),
                  if (voteCount != null)
                    Text(voteCount.toString(), style: textTheme.titleSmall),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: AppMargin.vSmall,
          child: _rateThisButton(textTheme),
        ),
      ],
    );
  }

  Widget _rateThisButton(TextTheme textTheme) {
    return voteCount == null
        ? Row(
            children: [
              const Icon(Icons.star_border, color: AppColors.accent),
              SizedBox(width: AppWidth.w4.w),
              Text(
                'Rate',
                style: textTheme.titleSmall!.copyWith(color: AppColors.accent),
              ),
            ],
          )
        : Column(
            children: [
              const Icon(Icons.star_border, color: AppColors.accent),
              SizedBox(width: AppWidth.w4.w),
              Text(
                'Rate this',
                style: textTheme.titleSmall!.copyWith(color: AppColors.accent),
              ),
            ],
          );
  }
}
