import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating / 2,
      minRating: 0,
      maxRating: 5,
      itemCount: 5,
      direction: Axis.horizontal,
      itemSize: AppSize.s14.sp,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0).w,
      itemBuilder: (context, _) =>
          const Icon(Icons.star, color: AppColors.rating),
      onRatingUpdate: (rating) {},
    );
  }
}
