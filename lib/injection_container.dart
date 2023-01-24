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

final sl = GetIt.instance;

void init() {
  //bloc
  sl.registerFactory(() => MovieBloc(sl(), sl(), sl(), sl(), sl()));

  //use cases
  sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetUpcomingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
  sl.registerLazySingleton(() => GetMovieReviewsUseCase(sl()));
  
  //repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));

  //core
  sl.registerLazySingleton(() => ApiService());
}
