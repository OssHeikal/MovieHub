import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/resources/values.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });
  final String label;
  final Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(label),
        ),
        if (icon != null)
          Container(
            margin: EdgeInsets.only(left: AppMargin.m4.w),
            child: Icon(
              icon,
              size: AppSize.s16.sp,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
      ],
    );
  }
}
