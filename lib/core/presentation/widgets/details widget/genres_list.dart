import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/genre_chip.dart';
import 'package:movie_hub/core/resources/values.dart';

class GenreList extends StatelessWidget {
  const GenreList({super.key, required this.genres});
  final List genres;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeight.h30,
      // margin: const EdgeInsets.only(top: 14),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: AppWidth.w14.w),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        separatorBuilder: (context, index) => SizedBox(width: AppWidth.w10.w),
        itemBuilder: (context, index) => GenreChip(genre: genres[index]),
      ),
    );
  }
}
