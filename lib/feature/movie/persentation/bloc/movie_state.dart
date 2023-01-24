import 'package:intv_movie/core/shared-model/review/review_response.dart';
import 'package:intv_movie/feature/movie/data/model/movie_detail_response.dart';
import 'package:intv_movie/feature/movie/data/model/movie_response.dart';

class MovieState {
  final MovieResponse? nowPlayingMovies;
  final MovieResponse? upcomingMovies;
  final MovieResponse? popularMovies;
  final MovieDetailResponse? movieDetails;
  final ReviewResponse? movieReviews;

  MovieState({
    this.nowPlayingMovies,
    this.upcomingMovies,
    this.popularMovies,
    this.movieDetails,
    this.movieReviews
  });

  MovieState copyWith({
    MovieResponse? nowPlayingMovies,
    MovieResponse? upcomingMovies,
    MovieResponse? popularMovies,
    MovieDetailResponse? movieDetails,
    ReviewResponse? movieReviews,
  }) {

    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      movieDetails: movieDetails ?? this.movieDetails,
      movieReviews: movieReviews ?? this.movieReviews
    );
    
  }
}