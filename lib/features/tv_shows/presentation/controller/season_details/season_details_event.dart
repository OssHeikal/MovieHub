part of 'season_details_bloc.dart';

abstract class SeasonDetailsEvent extends Equatable {
  const SeasonDetailsEvent();

  @override
  List<Object> get props => [];
}

class SeasonDetailsFetched extends SeasonDetailsEvent {
  const SeasonDetailsFetched(this.seasonParams);

  final SeasonParams seasonParams;

  @override
  List<Object> get props => [seasonParams];
}
