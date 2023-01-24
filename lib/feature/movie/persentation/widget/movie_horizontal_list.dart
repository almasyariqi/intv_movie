import 'package:flutter/material.dart';
import 'package:intv_movie/core/shared-widget/card/movie_card.dart';
import 'package:intv_movie/core/utils/converters.dart';
import 'package:intv_movie/core/utils/movie_type.dart';
import 'package:intv_movie/core/utils/size_config.dart';
import 'package:intv_movie/feature/movie/data/model/movie.dart';

class MovieHorizontalList extends StatelessWidget {
  final List<Movie>? movies;
  final bool isEmpty;
  final bool isLoading;
  final MovieType movieType;
  final double cardWidth;
  final double cardHeight;
  final bool useTitleBackground;
  final bool showTitle;
  final bool showSubtitle;
  final double cardBorderRadius;
  final Function? onPressedItem;

  const MovieHorizontalList({
    Key? key,
    required this.movies,
    required this.isEmpty,
    required this.isLoading,
    required this.movieType,
    this.cardWidth = 100,
    this.cardHeight = 200,
    this.useTitleBackground = false,
    this.showTitle = true,
    this.showSubtitle = true,
    this.cardBorderRadius = 10,
    this.onPressedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(cardHeight),
      child: isLoading
          ? _loading()
          : isEmpty
              ? _emptyList()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies?.length,
                  itemBuilder: (builderContext, index) {
                    return Row(
                      children: [
                        SizedBox(
                          width: getProportionateScreenWidth(15),
                        ),
                        InkWell(
                          onTap: onPressedItem as void Function()?,
                          child: SimpleMovieCard(
                            imageUri: _movieImageUri(movies, index),
                            width: cardWidth,
                            height: cardHeight,
                            title: movies?[index].title ?? "",
                            showTitle: showTitle,
                            showSubTitle: showSubtitle,
                            subtitle: _movieSubtitle(movies, index),
                            borderRadius: cardBorderRadius,
                            useBackground: useTitleBackground,
                          ),
                        ),
                      ],
                    );
                  }),
    );
  }

  Widget _emptyList() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: const Center(
        child: Text("Tidak ada data"),
      ),
    );
  }

  Widget _loading() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  String _movieImageUri(List<Movie>? movies, int index) {
    switch (movieType) {
      case MovieType.nowPlaying:
        return movies?[index].posterPath ?? "";
      case MovieType.popular:
        return movies?[index].backdropPath ?? "";
      case MovieType.upcoming:
        return movies?[index].backdropPath ?? "";
      default:
        return movies?[index].posterPath ?? "";
    }
  }

  String _movieSubtitle(List<Movie>? movies, int index) {
    switch (movieType) {
      case MovieType.nowPlaying:
        return "";
      case MovieType.popular:
        return "Popularity (${convertPopularityString(movies?[index].popularity)})";
      case MovieType.upcoming:
        return "Release on ${movies?[index].releaseDate}";
      default:
        return "";
    }
  }
}
