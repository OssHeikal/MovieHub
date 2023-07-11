import 'package:flutter/material.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';

class SliderCardFooter extends StatelessWidget {
  const SliderCardFooter({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: AppPadding.medium.copyWith(bottom: AppPadding.p6),
        height: AppHeight.h120,
        decoration: BoxDecoration(gradient: AppGradient.primary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subTitle,
              style: textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
