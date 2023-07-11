import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/resources/values.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.action,
  });

  final String title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.medium.copyWith(bottom: 0),
      child: Row(
        children: [
          Container(
            height: AppHeight.h24.h,
            width: AppWidth.w4.w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(AppSize.s6),
            ),
          ),
          SizedBox(width: AppWidth.w10.h),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const Spacer(),
          if (action != null) action!,
        ],
      ),
    );
  }
}
