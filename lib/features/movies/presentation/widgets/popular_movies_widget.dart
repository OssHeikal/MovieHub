import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/presentation/widgets/details_card_tile.dart';
import 'package:movie_hub/core/presentation/widgets/lazy_load_list_view.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/movies/presentation/controller/popular_movies/popular_movies_bloc.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({super.key, required this.popularMovies});

  final List<Media> popularMovies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (context, state) {
        return LazyLoadListView(
          itemCount: popularMovies.length + 1,
          itemBuilder: (context, index) {
            if (index < popularMovies.length) {
              return DetailsCardTile(media: popularMovies[index]);
            } else {
              return SizedBox(
                  height: AppHeight.h60.h,
                  child: const CustomLoadingIndicator());
            }
          },
          onScrollDidReachEnd: () {
            context.read<PopularMoviesBloc>().add(MorePopularMoviesFetched());
          },
        );
      },
    );
  }
}
