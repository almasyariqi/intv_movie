abstract class MovieEvent {}

class GetAllMovieLists extends MovieEvent {
  final int page;

  GetAllMovieLists({this.page = 1});
}

class GetNowPlayingMovies extends MovieEvent {
  final int page;

  GetNowPlayingMovies({this.page = 1});
}

class GetUpcomingMovies extends MovieEvent {
  final int page;

  GetUpcomingMovies({this.page = 1});
}

class GetPopularMovies extends MovieEvent {
  final int page;

  GetPopularMovies({this.page = 1});
}

class GetMovieDetails extends MovieEvent {
  final int movieId;

  GetMovieDetails({required this.movieId});
}

class GetMovieReviews extends MovieEvent {
  final int page;
  final int movieId;

  GetMovieReviews({this.page = 1, required this.movieId});
}