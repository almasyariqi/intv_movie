import 'package:intv_movie/core/network/api_service.dart';
import 'package:intv_movie/feature/tv/data/model/tv_response.dart';
import 'package:intv_movie/feature/tv/data/model/tv_detail_response.dart';
import 'package:intv_movie/core/shared-model/review/review_response.dart';
import 'package:intv_movie/feature/tv/data/repository/tv_repository.dart';

class TvRepositoryImpl implements TvRepository {
  final ApiService _apiService;

  TvRepositoryImpl(this._apiService);

  @override
  Future<TvResponse> getOnTheAirTv(int page) async {
      return await _apiService.getOnTheAirTv(page);
  }
  
  @override
  Future<TvResponse> getPopularTv(int page) async {
      return await _apiService.getPopularTv(page);
  }
  
  @override
  Future<TvDetailResponse> getTvDetails(int tvId) async {
      return await _apiService.getTvDetails(tvId);
  }
  
  @override
  Future<ReviewResponse> getTvReviews(int page, int tvId) async {
    return await _apiService.getTvReviews(page, tvId);
  }
  
}