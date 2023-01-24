import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intv_movie/feature/movie/persentation/bloc/movie_bloc.dart';
import 'package:intv_movie/feature/movie/persentation/bloc/movie_event.dart';
import 'package:intv_movie/feature/movie/persentation/bloc/movie_state.dart';
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
            return Column(
              children: [
                Text(state.nowPlayingMovies?.totalPages.toString() ?? "Tes 1"),
                Text(state.upcomingMovies?.totalPages.toString() ?? "Tes 1"),
                Text(state.popularMovies?.totalPages.toString() ?? "Tes 1"),
              ],
            );
          })),
    );
  }
}
