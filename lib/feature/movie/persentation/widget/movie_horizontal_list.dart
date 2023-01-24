import 'package:flutter/material.dart';
import 'package:intv_movie/core/shared-widget/card/movie_card.dart';
import 'package:intv_movie/core/utils/movie_type.dart';
import 'package:intv_movie/core/utils/size_config.dart';
import 'package:intv_movie/feature/movie/data/model/movie.dart';

class MovieHorizontalList extends StatelessWidget {
  final List<Movie> movies;
  final bool isEmpty;
  final bool isLoading;
  final MovieType movieType;
  final double cardWidth;
  final double cardHeight;
  final bool showTitle;
  final bool showSubtitle;
  final Function? onPressedItem;

  const MovieHorizontalList({
    Key? key,
    required this.movies,
    required this.isEmpty,
    required this.isLoading,
    required this.movieType,
    this.cardWidth = 100,
    this.cardHeight = 200,
    this.showTitle = true,
    this.showSubtitle = true,
    this.onPressedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30),
        vertical: getProportionateScreenHeight(12),
      ),
      child: isLoading
          ? _loading()
          : isEmpty
              ? _emptyList()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (builderContext, index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: onPressedItem as void Function()?,
                          child: SimpleMovieCard(
                            imageUri: _movieImageUri(movies, index),
                            width: cardWidth,
                            height: cardHeight,
                            title: movies[index].title ?? "",
                            showTitle: showTitle,
                            showSubTitle: showSubtitle,
                            subtitle: _movieSubtitle(movies, index),
                          ),
                        ),
                      ],
                    );
                  }),
    );
  }

  Widget _emptyList() {
    return Container(
      color: Colors.white,
      height: getProportionateScreenHeight(500),
      width: double.infinity,
      child: const Center(
        child: Text("Tidak ada data"),
      ),
    );
  }

  Widget _loading() {
    return Container(
      color: Colors.white,
      height: getProportionateScreenHeight(500),
      width: double.infinity,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  String _movieImageUri(List<Movie> movies, int index) {
    switch (movieType) {
      case MovieType.nowPlaying:
        return movies[index].backdropPath ?? "";
      case MovieType.popular:
        return movies[index].posterPath ?? "";
      case MovieType.upcoming:
        return movies[index].posterPath ?? "";
      default:
        return movies[index].posterPath ?? "";
    }
  }

  String _movieSubtitle(List<Movie> movies, int index) {
    switch (movieType) {
      case MovieType.nowPlaying:
        return "";
      case MovieType.popular:
        return "Popularity (${movies[index].popularity})";
      case MovieType.upcoming:
        return "Release on (${movies[index].releaseDate})";
      default:
        return "";
    }
  }
}
