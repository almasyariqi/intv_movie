import 'package:flutter/material.dart';
import 'package:intv_movie/core/shared-widget/card/movie_card.dart';
import 'package:intv_movie/core/shared-widget/card/rating_box_card.dart';
import 'package:intv_movie/core/utils/converters.dart';
import 'package:intv_movie/core/utils/size_config.dart';

class MovieDetailCard extends StatelessWidget {
  final String posterUri;
  final double rating;
  final int voteCount;
  final String genres;
  final String overview;

  const MovieDetailCard(
      {Key? key,
      required this.posterUri,
      this.rating = 7.5,
      this.voteCount = 1024,
      this.genres = "Action, Sci-Fi",
      this.overview = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      width: getScreenWidth(),
      height: getProportionateScreenHeight(280),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SimpleMovieCard(
            imageUri: posterUri,
            width: 160,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBoxCard(rating: rating),
                      SizedBox(width: getProportionateScreenWidth(10)),
                      Text(
                        convertPopularityString(voteCount.toDouble()) +
                            " Votes",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: getProportionateScreenWidth(15),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text(
                    genres,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      color: Colors.black.withOpacity(0.3)
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text(
                    overview,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
