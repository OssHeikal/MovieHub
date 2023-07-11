import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/domain/entities/genre.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/genres_list.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/overview_text.dart';
import 'package:movie_hub/core/presentation/widgets/shimmer_image.dart';
import 'package:movie_hub/core/resources/values.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({
    super.key,
    required this.overview,
    required this.imageUrl,
    required this.title,
    this.genres = const [],
    this.showTrailingIcon = true,
    this.borderRadius = 0,
  });
  final String overview;
  final String imageUrl;
  final String title;
  final List<Genre> genres;
  final bool showTrailingIcon;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(14, 0, 0, 14).w,
              child: ShimmerImage(
                width: AppWidth.w80.w,
                height: AppHeight.h120.h,
                imageUrl: imageUrl,
                borderRadius: borderRadius,
              ),
            ),
            SizedBox(width: AppWidth.w6.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (genres.isNotEmpty) GenreList(genres: genres),
                  OverviewText(
                    text: overview,
                    movieTitle: title,
                    showTrailingIcon: showTrailingIcon,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
