import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/review%20widget/review_footer.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/utils/bottom_sheet_utils.dart';
import 'package:movie_hub/core/domain/entities/review.dart';

import 'review_header.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key, required this.review});
  final Review review;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        BottomSheetUtils.showScrollableBottomSheet(
          context,
          content: Text(
            review.content,
            style:
                textTheme.bodyLarge!.copyWith(color: AppColors.textSecondary),
          ),
          header: ReviewHeader(
            name: review.authorName.isEmpty
                ? review.autherUsername
                : review.authorName,
            userName: review.autherUsername,
            avatarUrl: review.autherAvatar,
          ),
        );
      },
      child: Container(
        width: AppWidth.w200.w,
        padding: const EdgeInsets.all(AppHeight.h8).w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: AppSize.s4,
              blurRadius: AppSize.s10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReviewHeader(
              name: review.authorName.isEmpty
                  ? review.autherUsername
                  : review.authorName,
              userName: review.autherUsername,
              avatarUrl: review.autherAvatar,
            ),
            Text(
              review.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            ReviewFooter(createdAt: review.createdAt, rating: review.rating),
          ],
        ),
      ),
    );
  }
}
