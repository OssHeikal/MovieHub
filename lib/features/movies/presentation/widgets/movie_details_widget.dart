import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/cast/cast_footer.dart';
import 'package:movie_hub/core/presentation/widgets/cast/cast_tile.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/details_card.dart';
import 'package:movie_hub/core/presentation/widgets/media_card_tile.dart';
import 'package:movie_hub/core/presentation/widgets/review%20widget/review_tile.dart';
import 'package:movie_hub/core/presentation/widgets/section_card.dart';
import 'package:movie_hub/core/resources/strings.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({
    super.key,
    required this.movieDetails,
  });
  final MediaDetails movieDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              MediaDetailsCard(mediaDetails: movieDetails),
              SizedBox(height: AppHeight.h20.h),
              SectionCard(
                height: AppHeight.h330,
                bottomPadding: 0,
                sectionTitle: AppString.cast,
                itemCount: movieDetails.credits.cast.length,
                itemBuilder: (context, index) =>
                    CastTile(cast: movieDetails.credits.cast[index]),
                sectionFooter: CastFooter(
                  director: movieDetails.credits.director,
                  producer: movieDetails.credits.producer,
                ),
              ),
              SizedBox(height: AppHeight.h20.h),
              SectionCard(
                  height: AppHeight.h220,
                  sectionTitle: AppString.review,
                  itemCount: movieDetails.reviews.isEmpty
                      ? 1
                      : movieDetails.reviews.length,
                  itemBuilder: (context, index) {
                    if (movieDetails.reviews.isEmpty) {
                      return const Center(child: Text(AppString.noReview));
                    }
                    return ReviewTile(review: movieDetails.reviews[index]);
                  }),
              SizedBox(height: AppHeight.h20.h),
              SectionCard(
                sectionTitle: AppString.moreLikeThis,
                itemCount: movieDetails.similar.length,
                itemBuilder: (context, index) =>
                    MediaCardTile(media: movieDetails.similar[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
