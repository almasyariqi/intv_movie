import 'package:intv_movie/core/shared-model/review/review_response.dart';
import 'package:intv_movie/feature/tv/data/model/tv_detail_response.dart';
import 'package:intv_movie/feature/tv/data/model/tv_response.dart';

class TvState {
  final TvResponse? onTheAirTv;
  final TvResponse? popularTv;
  final TvDetailResponse? tvDetails;
  final ReviewResponse? tvReviews;

  TvState({
    this.onTheAirTv,
    this.popularTv,
    this.tvDetails,
    this.tvReviews
  });

  TvState copyWith({
    TvResponse? onTheAirTv,
    TvResponse? popularTv,
    TvDetailResponse? tvDetails,
    ReviewResponse? tvReviews
  }) {
    
    return TvState(
      onTheAirTv: onTheAirTv ?? this.onTheAirTv,
      popularTv: popularTv ?? this.popularTv,
      tvDetails: tvDetails ?? this.tvDetails,
      tvReviews: tvReviews ?? this.tvReviews
    );

  }
}