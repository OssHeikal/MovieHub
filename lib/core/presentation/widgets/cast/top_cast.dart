import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/cast/top_cast_tile.dart';
import 'package:movie_hub/core/resources/strings.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/cast.dart';

class TopCastSection extends StatelessWidget {
  const TopCastSection({super.key, required this.cast});
  final List<Cast> cast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0).w,
          child: Text(
            AppString.topCast,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          height: AppHeight.h60.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: AppMargin.hMedium.w,
            itemCount: cast.length < 10 ? cast.length : 10,
            separatorBuilder: (context, index) =>
                SizedBox(width: AppWidth.w8.w),
            itemBuilder: (context, index) {
              final length = cast.length < 10 ? cast.length : 10;
              final List<Cast> topCast = cast.sublist(0, length);
              return TopCastTile(cast: topCast[index]);
            },
          ),
        ),
      ],
    );
  }
}
