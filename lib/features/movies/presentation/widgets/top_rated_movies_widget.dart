import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/presentation/widgets/details_card_tile.dart';
import 'package:movie_hub/core/presentation/widgets/lazy_load_list_view.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/movies/presentation/controller/top_rated_movies/top_rated_movies_bloc.dart';

class TopRatedMoviesWidget extends StatelessWidget {
  const TopRatedMoviesWidget({super.key, required this.topRatedMovies});

  final List<Media> topRatedMovies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
        builder: (context, state) {
      return LazyLoadListView(
        itemCount: topRatedMovies.length + 1,
        itemBuilder: (context, index) {
          if (index < topRatedMovies.length) {
            return DetailsCardTile(media: topRatedMovies[index]);
          } else {
            return SizedBox(
                height: AppHeight.h60.h, child: const CustomLoadingIndicator());
          }
        },
        onScrollDidReachEnd: () {
          context.read<TopRatedMoviesBloc>().add(MoreTopRatedMoviesFetched());
        },
      );
    });
  }
}
