import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intv_movie/feature/movie/domain/usecase/get_movie_details_usecase.dart';
import 'package:intv_movie/feature/movie/domain/usecase/get_movie_reviews_usecase.dart';
import 'package:intv_movie/feature/movie/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:intv_movie/feature/movie/domain/usecase/get_popular_movies_usecase.dart';
import 'package:intv_movie/feature/movie/domain/usecase/get_upcoming_movies_usecase.dart';
import 'package:intv_movie/feature/movie/persentation/bloc/movie_event.dart';
import 'package:intv_movie/feature/movie/persentation/bloc/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayinMovieUseCase;
  final GetUpcomingMoviesUseCase getUpcomingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieReviewsUseCase getMovieReviewsUseCase;

  MovieBloc(
      this.getNowPlayinMovieUseCase,
      this.getUpcomingMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getMovieDetailsUseCase,
      this.getMovieReviewsUseCase)
      : super(MovieState()) {
        on<GetAllMovieLists>(_getAllMovieLists);
        on<GetNowPlayingMovies>(_getNowPlayingMovies);
        on<GetUpcomingMovies>(_getUpcomingMovies);
        on<GetPopularMovies>(_getPopularMovies);
        on<GetMovieDetails>(_getMovieDetails);
        on<GetMovieReviews>(_getMovieReviews);
      }

  void _getAllMovieLists(
    GetAllMovieLists event,
    Emitter<MovieState> emit
  ) async {

    add(GetNowPlayingMovies(page: event.page));
    add(GetUpcomingMovies(page: event.page));
    add(GetPopularMovies(page: event.page));

  }

  void _getNowPlayingMovies(
      GetNowPlayingMovies event, Emitter<MovieState> emit) async {
    try {
      final nowPlayingMovies = await getNowPlayinMovieUseCase(event.page);
      emit(state.copyWith(nowPlayingMovies: nowPlayingMovies));
    } on Exception catch (e) {
      debugPrint("Gagal");
    }
  }

  void _getUpcomingMovies(
      GetUpcomingMovies event, Emitter<MovieState> emit) async {
    try {
      final upcomingMovies = await getUpcomingMoviesUseCase(event.page);
      emit(state.copyWith(upcomingMovies: upcomingMovies));
    } on Exception catch (e) {
      debugPrint("Gagal");
    }
  }

  void _getPopularMovies(
      GetPopularMovies event, Emitter<MovieState> emit) async {
    try {
      final popularMovies = await getPopularMoviesUseCase(event.page);
      emit(state.copyWith(popularMovies: popularMovies));
    } on Exception catch (e) {
      debugPrint("Gagal");
    }
  }

  void _getMovieDetails(GetMovieDetails event, Emitter<MovieState> emit) async {
    try {
      final movieDetails = await getMovieDetailsUseCase(event.movieId);
      emit(state.copyWith(movieDetails: movieDetails));
    } on Exception catch (e) {
      debugPrint("Gagal");
    }
  }

  void _getMovieReviews(GetMovieReviews event, Emitter<MovieState> emit) async {
    try {
      final movieReviews = await getMovieReviewsUseCase(
          MovieReviewsParams(page: event.page, movieId: event.movieId));
      emit(state.copyWith(movieReviews: movieReviews));
    } on Exception catch (e) {
      debugPrint("Gagal");
    }
  }
}
