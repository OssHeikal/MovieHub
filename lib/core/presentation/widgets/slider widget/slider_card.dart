import 'package:flutter/material.dart';
import 'package:movie_hub/core/presentation/widgets/shimmer_image.dart';
import 'package:movie_hub/core/presentation/widgets/slider%20widget/slider_card_footer.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/media.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShimmerImage(
          height: AppHeight.h240,
          imageUrl: media.backdropPath,
        ),
        SliderCardFooter(
          title: media.title,
          subTitle: media.releaseDate,
        ),
      ],
    );
  }
}
