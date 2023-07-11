import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/resources/values.dart';

class SectionContent extends StatelessWidget {
  const SectionContent({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.bottomPadding = AppPadding.p14,
  });
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    const double p14 = AppPadding.p14;
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(p14, p14, p14, bottomPadding).w,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (context, index) => SizedBox(width: AppWidth.w10.w),
        itemBuilder: itemBuilder,
      ),
    );
  }
}
