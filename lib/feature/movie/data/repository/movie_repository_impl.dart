import 'package:intv_movie/core/network/api_service.dart';
import 'package:intv_movie/feature/movie/data/model/movie_response.dart';
import 'package:intv_movie/feature/movie/data/model/movie_detail_response.dart';
import 'package:intv_movie/core/shared-model/review/review_response.dart';
import 'package:intv_movie/feature/movie/data/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiService _apiService;

  MovieRepositoryImpl(this._apiService);

  @override
  Future<MovieDetailResponse> getMovieDetails(int movieId) async {
     return await _apiService.getMovieDetails(movieId);
  }
  
  @override
  Future<ReviewResponse> getMovieReviews(int page, int movieId) async {
    return await _apiService.getMovieReviews(page, movieId);
  }
  
  @override
  Future<MovieResponse> getNowPlayingMovies(int page) async {
      return await _apiService.getNowPlayingMovies(page);
  }
  
  @override
  Future<MovieResponse> getPopularMovies(int page) async {
      return await _apiService.getPopularMovies(page);
  }
  
  @override
  Future<MovieResponse> getUpcomingMovies(int page) async {
    return await _apiService.getUpcomingMovies(page);
  }
  
}