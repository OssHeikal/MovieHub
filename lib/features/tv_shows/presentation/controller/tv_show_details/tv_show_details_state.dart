part of 'tv_show_details_bloc.dart';

class TvShowDetailsState extends Equatable {
  const TvShowDetailsState({
    this.status = RequestStatus.loading,
    this.tvShowDetails = const MediaDetails.empty(),
  });
  final RequestStatus status;
  final MediaDetails tvShowDetails;

  TvShowDetailsState copyWith({
    RequestStatus? status,
    MediaDetails? tvShowDetails,
  }) {
    return TvShowDetailsState(
      status: status ?? this.status,
      tvShowDetails: tvShowDetails ?? this.tvShowDetails,
    );
  }

  @override
  List<Object> get props => [status, tvShowDetails];
}
