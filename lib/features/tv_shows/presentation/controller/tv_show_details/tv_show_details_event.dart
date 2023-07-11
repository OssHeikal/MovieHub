part of 'tv_show_details_bloc.dart';

abstract class TvShowDetailsEvent extends Equatable {
  const TvShowDetailsEvent();

  @override
  List<Object> get props => [];
}

class TvShowDetailsFetched extends TvShowDetailsEvent {
  const TvShowDetailsFetched(this.showId);

  final int showId;

  @override
  List<Object> get props => [showId];
}
