import 'package:intv_movie/core/shared-model/review/review_response.dart';
import 'package:intv_movie/core/usecase/usecase.dart';
import 'package:intv_movie/feature/movie/data/repository/movie_repository.dart';

class GetMovieReviewsUseCase implements UseCase<ReviewResponse, MovieReviewsParams> {
  final MovieRepository _repository;

  GetMovieReviewsUseCase(this._repository);

  @override
  Future<ReviewResponse> call(MovieReviewsParams params) async {
    return await _repository.getMovieReviews(params.page, params.movieId);
  }
    
}

class MovieReviewsParams {
  final int page;
  final int movieId;

  MovieReviewsParams({
    required this.page,
    required this.movieId
  }) : super();
}