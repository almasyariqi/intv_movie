import 'package:intv_movie/core/shared-model/review/review_response.dart';
import 'package:intv_movie/core/usecase/usecase.dart';
import 'package:intv_movie/feature/tv/data/repository/tv_repository.dart';

class GetTvReviewsUseCase implements UseCase<ReviewResponse, TvReviewsParams> {
  final TvRepository _repository;

  GetTvReviewsUseCase(this._repository);

  @override
  Future<ReviewResponse> call(TvReviewsParams params) async {
    return await _repository.getTvReviews(params.page, params.tvId);
  }
}

class TvReviewsParams {
  final int page;
  final int tvId;

  TvReviewsParams({
    required this.page,
    required this.tvId
  }) : super();
}