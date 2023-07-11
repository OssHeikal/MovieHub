import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/presentation/widgets/details_card_tile.dart';
import 'package:movie_hub/core/presentation/widgets/lazy_load_list_view.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/tv_shows/presentation/controller/popular_tv_shows/popular_tv_shows_bloc.dart';

class PopularTvShowsWidget extends StatelessWidget {
  const PopularTvShowsWidget({super.key, required this.popularTvShows});

  final List<Media> popularTvShows;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularTvShowsBloc, PopularTvShowsState>(
      builder: (context, state) {
        return LazyLoadListView(
          itemCount: popularTvShows.length + 1,
          itemBuilder: (context, index) {
            if (index < popularTvShows.length) {
              return DetailsCardTile(media: popularTvShows[index]);
            } else {
              return SizedBox(
                  height: AppHeight.h60.h,
                  child: const CustomLoadingIndicator());
            }
          },
          onScrollDidReachEnd: () {
            context.read<PopularTvShowsBloc>().add(MorePopularTvShowsFetched());
          },
        );
      },
    );
  }
}
