import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/episode.dart';
import 'package:movie_hub/features/tv_shows/domain/entities/season_details.dart';
import 'package:movie_hub/features/tv_shows/presentation/widgets/season_details_card_tile.dart';

class SeasonDetailsWidget extends StatelessWidget {
   SeasonDetailsWidget({super.key, required this.seasonDetails});

  final SeasonDetails seasonDetails;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final List<Episode> episodes = seasonDetails.episodes;
    return CupertinoScrollbar(
      controller: _scrollController,
      child: ListView.separated(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        itemCount: episodes.length,
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemBuilder: (context, index) {
          return SeasonDetailsCardTile(
              episode: episodes[index], index: index + 1);
        },
      ),
    );
  }
}
