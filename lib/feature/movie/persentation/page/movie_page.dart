import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intv_movie/core/network/api_response_state.dart';
import 'package:intv_movie/core/utils/movie_type.dart';
import 'package:intv_movie/core/utils/size_config.dart';
import 'package:intv_movie/feature/movie/persentation/bloc/movie_bloc.dart';
import 'package:intv_movie/feature/movie/persentation/bloc/movie_event.dart';
import 'package:intv_movie/feature/movie/persentation/bloc/movie_state.dart';
import 'package:intv_movie/feature/movie/persentation/page/movie_detail_page.dart';
import 'package:intv_movie/feature/movie/persentation/widget/movie_horizontal_list.dart';
import 'package:intv_movie/injection_container.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("INTV MOVIES"),
      ),
      body: BlocProvider(
          create: (_) => sl<MovieBloc>()..add(GetAllMovieLists(page: 1)),
          child: BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
            return Container(
                child: RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    _titleText("Now Playing"),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    MovieHorizontalList(
                      movies: state.nowPlayingMovies?.results,
                      isEmpty: state.nowPlayingMovies?.results?.isEmpty ?? true,
                      isLoading: state.responseState is ResLoading,
                      movieType: MovieType.nowPlaying,
                      cardWidth: 200,
                      cardHeight: 300,
                      showTitle: false,
                      showSubtitle: false,
                      onPressedItem: (movieId) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailPage(movieId: movieId)));
                      },
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    _titleText("Upcoming Movies"),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    MovieHorizontalList(
                      movies: state.upcomingMovies?.results,
                      isEmpty: state.upcomingMovies?.results?.isEmpty ?? true,
                      isLoading: state.responseState is ResLoading,
                      movieType: MovieType.upcoming,
                      cardWidth: 300,
                      useTitleBackground: true,
                      onPressedItem: (movieId) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailPage(movieId: movieId)));
                      },
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    _titleText("Popular Movies"),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    MovieHorizontalList(
                      movies: state.popularMovies?.results,
                      isEmpty: state.popularMovies?.results?.isEmpty ?? true,
                      isLoading: state.responseState is ResLoading,
                      movieType: MovieType.popular,
                      cardWidth: 200,
                      cardHeight: 300,
                      useTitleBackground: true,
                      onPressedItem: (movieId) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailPage(movieId: movieId)));
                      },
                    ),
                  ],
                ),
              ),
            ));
          })),
    );
  }

  Widget _titleText(String title) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: getProportionateScreenWidth(20),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    context.read<MovieBloc>().add(GetAllMovieLists(page: 1));
  }
}
