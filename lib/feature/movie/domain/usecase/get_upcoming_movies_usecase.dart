import 'package:intv_movie/core/usecase/usecase.dart';
import 'package:intv_movie/feature/movie/data/model/movie_response.dart';
import 'package:intv_movie/feature/movie/data/repository/movie_repository.dart';

class GetUpcomingMoviesUseCase implements UseCase<MovieResponse, int> {
  final MovieRepository _repository;

  GetUpcomingMoviesUseCase(this._repository);

  @override
  Future<MovieResponse> call(int page) async {
    return await _repository.getUpcomingMovies(page);
  }
}