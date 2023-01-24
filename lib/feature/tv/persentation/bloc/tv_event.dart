abstract class TvEvent {}

class GetAllTvs extends TvEvent {
  final int page;

  GetAllTvs({this.page = 1});
}

class GetOnTheAirTv extends TvEvent {
  final int page;

  GetOnTheAirTv({this.page = 1});
}

class GetPopularTv extends TvEvent {
  final int page;

  GetPopularTv({this.page = 1});
}

class GetTvDetails extends TvEvent {
  final int tvId;

  GetTvDetails({required this.tvId});
}

class GetTvReviews extends TvEvent {
  final int page;
  final int tvId;

  GetTvReviews({this.page = 1, required this.tvId});
}

class InitTvDetailsState extends TvEvent {
  final int page;
  final int tvId;

  InitTvDetailsState({this.page = 1, required this.tvId});
}