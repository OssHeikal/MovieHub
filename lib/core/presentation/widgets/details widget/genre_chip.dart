import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/data/models/genre_model.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({super.key, required this.genre});
  final GenreModel genre;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppWidth.w4.w,
          vertical: AppHeight.h2.h,
        ).w,
        decoration: BoxDecoration(
          color: AppColors.transparent,
          border: Border.all(color: AppColors.divider),
          borderRadius: BorderRadius.circular(AppSize.s2.r),
        ),
        child: Text(
          genre.name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
