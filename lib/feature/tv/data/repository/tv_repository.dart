import 'package:intv_movie/core/shared-model/review/review_response.dart';
import 'package:intv_movie/feature/tv/data/model/tv_detail_response.dart';
import 'package:intv_movie/feature/tv/data/model/tv_response.dart';

abstract class TvRepository {
  Future<TvResponse> getOnTheAirTv(int page);
  Future<TvResponse> getPopularTv(int page);
  Future<TvDetailResponse> getTvDetails(int tvId);
  Future<ReviewResponse> getTvReviews(int page, int tvId);
}