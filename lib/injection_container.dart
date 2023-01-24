import 'package:get_it/get_it.dart';
import 'package:intv_movie/core/network/api_service.dart';
import 'package:intv_movie/feature/movie/data/repository/movie_repository.dart';
import 'package:intv_movie/feature/movie/data/repository/movie_repository_impl.dart';
import 'package:intv_movie/feature/movie/domain/usecase/get_movie_details_usecase.dart';
import 'package:intv_movie/feature/movie/domain/usecase/get_movie_reviews_usecase.dart';
import 'package:intv_movie/feature/movie/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:intv_movie/feature/movie/domain/usecase/get_popular_movies_usecase.dart';
import 'package:intv_movie/feature/movie/domain/usecase/get_upcoming_movies_usecase.dart';
import 'package:intv_movie/feature/movie/persentation/bloc/movie_bloc.dart';
import 'package:intv_movie/feature/tv/data/repository/tv_repository.dart';
import 'package:intv_movie/feature/tv/data/repository/tv_repository_impl.dart';
import 'package:intv_movie/feature/tv/domain/usecase/get_on_the_air_tv_usecase.dart';
import 'package:intv_movie/feature/tv/domain/usecase/get_popular_tv_usecase.dart';
import 'package:intv_movie/feature/tv/domain/usecase/get_tv_details_usecase.dart';
import 'package:intv_movie/feature/tv/domain/usecase/get_tv_reviews_usecase.dart';
import 'package:intv_movie/feature/tv/persentation/bloc/tv_bloc.dart';

final sl = GetIt.instance;

void init() {
  //bloc
  sl.registerFactory(() => MovieBloc(sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => TvBloc(sl(), sl(), sl(), sl()));

  //use cases
  sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetUpcomingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
  sl.registerLazySingleton(() => GetMovieReviewsUseCase(sl()));

  sl.registerLazySingleton(() => GetOnTheAirTvUseCase(sl()));
  sl.registerLazySingleton(() => GetPopularTvUseCase(sl()));
  sl.registerLazySingleton(() => GetTvDetailsUseCase(sl()));
  sl.registerLazySingleton(() => GetTvReviewsUseCase(sl()));
  
  //repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));
  sl.registerLazySingleton<TvRepository>(() => TvRepositoryImpl(sl()));

  //core
  sl.registerLazySingleton(() => ApiService());
}
