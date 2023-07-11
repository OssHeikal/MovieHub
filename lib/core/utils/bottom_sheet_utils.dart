import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/resources/values.dart';

class BottomSheetUtils {
  static void showBottomSheet(
    BuildContext context, {
    required Widget content,
    Widget? header,
  }) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.background,
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) => _buildBottomSheet(header, content),
    );
  }

  static Container _buildBottomSheet(Widget? title, Widget content) {
    const double p14 = AppPadding.p14;
    return Container(
      padding: const EdgeInsets.fromLTRB(p14, 0, p14, p14).w,
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title ?? const SizedBox.shrink(),
              SizedBox(height: AppHeight.h10.h),
              content,
            ],
          ),
        ],
      ),
    );
  }

  static void showScrollableBottomSheet(
    BuildContext context, {
    required Widget content,
    Widget? header,
  }) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.7,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          builder: (context, controller) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              controller: controller,
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14).w,
              children: [
                header ?? const SizedBox.shrink(),
                SizedBox(height: AppHeight.h10.h),
                content,
              ],
            );
          },
        );
      },
    );
  }
}
