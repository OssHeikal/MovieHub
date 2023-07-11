import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/resources/strings.dart';
import 'package:movie_hub/core/resources/values.dart';

class CastFooter extends StatelessWidget {
  const CastFooter({
    super.key,
    this.director,
    this.producer,
  });

  final String? director;
  final String? producer;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (director != null) ...[
          const Divider(thickness: 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppWidth.w14).w,
            child: _richText(
              context,
              lable: AppString.director,
              value: director!,
            ),
          ),
        ],
        if (producer != null) ...[
          const Divider(thickness: 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppWidth.w14).w,
            child: _richText(
              context,
              lable: AppString.producer,
              value: producer!,
            ),
          ),
        ],
        SizedBox(height: AppHeight.h10.h),
      ],
    );
  }

  Text _richText(
    BuildContext context, {
    required String lable,
    required String value,
  }) {
    return Text.rich(
      TextSpan(
        text: lable,
        style:
            Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
        children: [
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
