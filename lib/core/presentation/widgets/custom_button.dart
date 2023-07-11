import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.accent,
    this.icon,
    this.centerTitle = false,
    this.elevation,
    this.height = AppHeight.h40,
  });

  final String label;
  final void Function() onPressed;
  final Color color;
  final IconData? icon;
  final bool centerTitle;
  final double? elevation;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppMargin.hMedium,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          backgroundColor: MaterialStateProperty.all(color),
          minimumSize:
              MaterialStateProperty.all(Size(double.infinity, height.h)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment:
              centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: icon != null
              ? [
                  centerTitle
                      ? const SizedBox()
                      : SizedBox(width: AppWidth.w10.w),
                  Icon(icon, size: AppSize.s20.sp),
                  SizedBox(width: AppWidth.w10.w),
                  Text(label),
                  SizedBox(width: AppWidth.w10.w),
                ]
              : [Text(label)],
        ),
      ),
    );
  }
}
