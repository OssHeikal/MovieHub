import 'package:flutter/material.dart';
import 'package:movie_hub/core/presentation/widgets/image_card_footer.dart';
import 'package:movie_hub/core/presentation/widgets/shimmer_image.dart';
import 'package:movie_hub/core/resources/colors.dart';
import 'package:movie_hub/core/resources/values.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.height,
  });
  final String imageUrl;
  final String title;
  final String subTitle;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          ShimmerImage(height: AppHeight.h240, imageUrl: imageUrl),
          ImageCardFooter(
            title: title,
            subTitle: subTitle,
            backgroundGradient: AppGradient.secondary,
          ),
        ],
      ),
    );
  }
}
