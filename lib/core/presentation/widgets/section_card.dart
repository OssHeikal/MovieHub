import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/section_content.dart';
import 'package:movie_hub/core/presentation/widgets/section_header.dart';
import 'package:movie_hub/core/resources/values.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.sectionTitle,
    this.sectionFooter = const SizedBox(),
    this.height = AppHeight.h320,
    this.action,
    this.bottomPadding = AppPadding.p14,
  });

  final int itemCount;
  final String sectionTitle;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Widget sectionFooter;
  final double height;
  final Widget? action;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          SectionHeader(title: sectionTitle, action: action),
          SectionContent(
            itemBuilder: itemBuilder,
            itemCount: itemCount,
            bottomPadding: bottomPadding,
          ),
          // SizedBox(height: AppHeight.h4.h),
          sectionFooter,
        ],
      ),
    );
  }
}
