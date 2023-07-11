import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/avatar.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/cast.dart';

class TopCastTile extends StatelessWidget {
  const TopCastTile({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: AppHeight.h40.h,
            padding: const EdgeInsets.fromLTRB(48, 8, 8, 8).w,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s100.r),
              color: AppColors.secondarySwatch.withOpacity(0.5),
            ),
            child: Text(
              cast.name,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        Avatar(avatarUrl: cast.profilePath),
      ],
    );
  }
}
