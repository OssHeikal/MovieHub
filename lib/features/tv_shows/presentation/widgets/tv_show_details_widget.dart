import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_hub/core/presentation/widgets/cast/cast_footer.dart';
import 'package:movie_hub/core/presentation/widgets/cast/cast_tile.dart';
import 'package:movie_hub/core/presentation/widgets/custom_action_button.dart';
import 'package:movie_hub/core/presentation/widgets/details%20widget/details_card.dart';
import 'package:movie_hub/core/presentation/widgets/media_card_tile.dart';
import 'package:movie_hub/core/presentation/widgets/review%20widget/review_tile.dart';
import 'package:movie_hub/core/presentation/widgets/section_card.dart';
import 'package:movie_hub/core/resources/strings.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/media_details.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_routes.dart';
import 'package:movie_hub/features/tv_shows/core/tv_shows_strings.dart';
import 'package:movie_hub/features/tv_shows/presentation/widgets/season_card_tile.dart';

class TvShowDetailsWidget extends StatelessWidget {
  const TvShowDetailsWidget({
    super.key,
    required this.tvShowDetails,
  });
  final MediaDetails tvShowDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              MediaDetailsCard(mediaDetails: tvShowDetails),
              SizedBox(height: AppHeight.h20.h),
              _buildSeasonsSection(context),
              SizedBox(height: AppHeight.h20.h),
              _buildCastSection(),
              SizedBox(height: AppHeight.h20.h),
              _buildReviewSection(),
              SizedBox(height: AppHeight.h20.h),
              _buildSimilarSection(),
            ],
          ),
        ),
      ),
    );
  }

  SectionCard _buildSeasonsSection(BuildContext context) {
    return SectionCard(
      sectionTitle: TvShowsStrings.seasons,
      itemCount: tvShowDetails.seasons!.length,
      itemBuilder: (context, index) => InkWell(
        child: SeasonCardTile(season: tvShowDetails.seasons![index]),
        onTap: () => goToSeasonDetailsView(context, index),
      ),
      action: CustomActionButton(
        icon: Icons.arrow_forward_ios_rounded,
        label: '${tvShowDetails.numberOfEpisodes} ${TvShowsStrings.episodes}',
        onPressed: () => goToSeasonDetailsView(context, 0),
      ),
    );
  }

  SectionCard _buildReviewSection() {
    final reviews = tvShowDetails.reviews;
    return SectionCard(
      height: AppHeight.h220,
      sectionTitle: AppString.review,
      itemCount: reviews.isEmpty ? 1 : reviews.length,
      itemBuilder: (context, index) {
        if (reviews.isEmpty) {
          return const Center(child: Text(AppString.noReview));
        }
        return ReviewTile(review: reviews[index]);
      },
    );
  }

  SectionCard _buildCastSection() {
    return SectionCard(
      height: AppHeight.h300,
      bottomPadding: 0,
      sectionTitle: AppString.cast,
      sectionFooter: CastFooter(producer: tvShowDetails.credits.producer),
      itemCount: tvShowDetails.credits.cast.length,
      itemBuilder: (context, index) => CastTile(
        cast: tvShowDetails.credits.cast[index],
      ),
    );
  }

  SectionCard _buildSimilarSection() {
    return SectionCard(
      sectionTitle: AppString.moreLikeThis,
      itemCount: tvShowDetails.similar.length,
      itemBuilder: (context, index) =>
          MediaCardTile(media: tvShowDetails.similar[index]),
    );
  }

  Future<Object?> goToSeasonDetailsView(BuildContext context, int index) {
    return context.pushNamed(
      TvShowsRoutes.seasonDetails.name,
      extra: tvShowDetails.seasons,
      pathParameters: {'index': '$index', 'tvShowId': '${tvShowDetails.id}'},
    );
  }
}
