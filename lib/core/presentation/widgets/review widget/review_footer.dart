import 'package:flutter/material.dart';
import 'package:movie_hub/core/presentation/widgets/custom_rating_bar.dart';

class ReviewFooter extends StatelessWidget {
  const ReviewFooter({
    super.key,
    required this.createdAt,
    required this.rating,
  });
  final String createdAt;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomRatingBar(rating: rating),
        Text(createdAt, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
