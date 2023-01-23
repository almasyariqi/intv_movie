import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intv_movie/core/network/api_constants.dart';
import 'package:intv_movie/core/network/api_interceptors.dart';
import 'package:intv_movie/core/shared-model/review/review_response.dart';
import 'package:intv_movie/feature/movie/data/model/movie_detail_response.dart';
import 'package:intv_movie/feature/movie/data/model/movie_response.dart';
import 'package:intv_movie/feature/tv/data/model/tv_detail_response.dart';
import 'package:intv_movie/feature/tv/data/model/tv_response.dart';

class ApiService {
  Dio? _dio;

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      contentType: "application/json"
    ));

    _dio!.interceptors.add(ApiInterceptors());
  }

  Future<MovieResponse> getNowPlayingMovies(int page) async {
    final url = ApiConstants.nowPlayingMovies;

    try {
      final response = await _dio!.get(
        url,
        queryParameters: {
          "page": page,
          "apiKey": ApiConstants.apiKey
        }
      );

      if(response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.data));
      } else {
        throw Exception(response.statusCode);
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }

  Future<MovieResponse> getUpcomingMovies(int page) async {
    final url = ApiConstants.upcomingMovies;

    try {
      final response = await _dio!.get(
        url,
        queryParameters: {
          "page": page,
          "apiKey": ApiConstants.apiKey
        }
      );

      if(response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.data));
      } else {
        throw Exception(response.statusCode);
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }

  Future<MovieResponse> getPopularMovies(int page) async {
    final url = ApiConstants.popularMovies;

    try {
      final response = await _dio!.get(
        url,
        queryParameters: {
          "page": page,
          "apiKey": ApiConstants.apiKey
        }
      );

      if(response.statusCode == 200) {
        return MovieResponse.fromJson(json.decode(response.data));
      } else {
        throw Exception(response.statusCode);
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }

  Future<MovieDetailResponse> getMovieDetails(int movieId) async {
    final url = "${ApiConstants.movie}/$movieId";

    try {
      final response = await _dio!.get(
        url,
        queryParameters: {
          "apiKey": ApiConstants.apiKey
        }
      );

      if(response.statusCode == 200) {
        return MovieDetailResponse.fromJson(json.decode(response.data));
      } else {
        throw Exception(response.statusCode);
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }

  Future<ReviewResponse> getMovieReviews(int page, int movieId) async {
    final url = "${ApiConstants.movie}/$movieId/${ApiConstants.reviews}";

    try {
      final response = await _dio!.get(
        url,
        queryParameters: {
          "page": page,
          "apiKey": ApiConstants.apiKey
        }
      );

      if(response.statusCode == 200) {
        return ReviewResponse.fromJson(json.decode(response.data));
      } else {
        throw Exception(response.statusCode);
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }

  Future<TvResponse> getOnTheAirTv(int page) async {
    final url = ApiConstants.onTheAirTv;

    try {
      final response = await _dio!.get(
        url,
        queryParameters: {
          "page": page,
          "apiKey": ApiConstants.apiKey
        }
      );

      if(response.statusCode == 200) {
        return TvResponse.fromJson(json.decode(response.data));
      } else {
        throw Exception(response.statusCode);
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }

  Future<TvResponse> getPopularTv(int page) async {
    final url = ApiConstants.popularTv;

    try {
      final response = await _dio!.get(
        url,
        queryParameters: {
          "page": page,
          "apiKey": ApiConstants.apiKey
        }
      );

      if(response.statusCode == 200) {
        return TvResponse.fromJson(json.decode(response.data));
      } else {
        throw Exception(response.statusCode);
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }

  Future<TvDetailResponse> getTvDetails(int tvId) async {
    final url = "${ApiConstants.tv}/$tvId";

    try {
      final response = await _dio!.get(
        url,
        queryParameters: {
          "apiKey": ApiConstants.apiKey
        }
      );

      if(response.statusCode == 200) {
        return TvDetailResponse.fromJson(json.decode(response.data));
      } else {
        throw Exception(response.statusCode);
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }

  Future<ReviewResponse> getTvReviews(int page, int tvId) async {
    final url = "${ApiConstants.tv}/$tvId/${ApiConstants.reviews}";

    try {
      final response = await _dio!.get(
        url,
        queryParameters: {
          "page": page,
          "apiKey": ApiConstants.apiKey
        }
      );

      if(response.statusCode == 200) {
        return ReviewResponse.fromJson(json.decode(response.data));
      } else {
        throw Exception(response.statusCode);
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }
}