part of 'season_details_bloc.dart';

class SeasonDetailsState extends Equatable {
  const SeasonDetailsState({
    this.status = RequestStatus.loading,
    this.seasonDetails = const SeasonDetails.empty(),
  });

  final RequestStatus status;
  final SeasonDetails seasonDetails;

  SeasonDetailsState copyWith({
    RequestStatus? status,
    SeasonDetails? seasonDetails,
  }) {
    return SeasonDetailsState(
      status: status ?? this.status,
      seasonDetails: seasonDetails ?? this.seasonDetails,
    );
  }

  @override
  List<Object> get props => [status, seasonDetails];
}
