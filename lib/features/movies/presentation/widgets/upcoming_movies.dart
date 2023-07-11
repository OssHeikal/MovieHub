import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/core/presentation/widgets/custom_loading_indicator.dart';
import 'package:movie_hub/core/presentation/widgets/details_card_tile.dart';
import 'package:movie_hub/core/presentation/widgets/lazy_load_list_view.dart';
import 'package:movie_hub/core/resources/values.dart';
import 'package:movie_hub/core/domain/entities/media.dart';
import 'package:movie_hub/features/movies/presentation/controller/upcoming_movies/upcoming_movies_bloc.dart';

class UpcomingMoviesWidget extends StatelessWidget {
  const UpcomingMoviesWidget({super.key, required this.upcomingMovies});

  final List<Media> upcomingMovies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
        builder: (context, state) {
      return LazyLoadListView(
        itemCount: upcomingMovies.length + 1,
        itemBuilder: (context, index) {
          if (index < upcomingMovies.length) {
            return DetailsCardTile(media: upcomingMovies[index]);
          } else {
            return SizedBox(
                height: AppHeight.h60.h, child: const CustomLoadingIndicator());
          }
        },
        onScrollDidReachEnd: () {
          context.read<UpcomingMoviesBloc>().add(MoreUpcomingMoviesFetched());
        },
      );
    });
  }
}
