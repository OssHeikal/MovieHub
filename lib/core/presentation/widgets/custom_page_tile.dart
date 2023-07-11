import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';

class CustomPageTile extends StatelessWidget {
  const CustomPageTile({
    super.key,
    required this.child,
    required this.backgroundImagePath,
  });

  final Widget child;
  final String backgroundImagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppWidth.w6.w, vertical: AppHeight.h12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: (NetworkImage(backgroundImagePath)),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          opacity: 0.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}