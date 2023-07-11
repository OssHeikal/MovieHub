import 'package:flutter/material.dart';
import 'package:movie_hub/core/resources/values.dart';

class ImageCardFooter extends StatelessWidget {
  const ImageCardFooter({
    super.key,
    required this.title,
    required this.subTitle,
    this.backgroundGradient,
  });
  final String title;
  final String subTitle;
  final Gradient? backgroundGradient;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: AppHeight.h120,
        decoration: BoxDecoration(gradient: backgroundGradient),
        padding: AppPadding.medium.copyWith(bottom: AppPadding.p6),
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
