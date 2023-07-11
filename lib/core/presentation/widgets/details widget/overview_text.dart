import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/utils/bottom_sheet_utils.dart';

class OverviewText extends StatelessWidget {
  const OverviewText({
    super.key,
    required this.text,
    required this.movieTitle,
    this.showTrailingIcon = true,
  });

  final String text;
  final String movieTitle;
  final bool showTrailingIcon;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          BottomSheetUtils.showBottomSheet(
            context,
            content: Text(text,
                style: textTheme.bodyLarge!
                    .copyWith(color: AppColors.textSecondary)),
            header: Text('Plot: $movieTitle', style: textTheme.titleMedium),
          );
        },
        child: Container(
          margin: AppPadding.medium.copyWith(right: AppPadding.p10).w,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              if (showTrailingIcon)
                Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: AppSize.s20.sp,
                    color: AppColors.divider,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
