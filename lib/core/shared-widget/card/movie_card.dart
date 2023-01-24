import 'package:flutter/material.dart';
import 'package:intv_movie/core/network/api_constants.dart';
import 'package:intv_movie/core/utils/size_config.dart';
import 'package:intv_movie/core/utils/widget_constants.dart';

class SimpleMovieCard extends StatelessWidget {
  final String imageUri;
  final double width;
  final double height;
  final double borderRadius;
  final String title;
  final bool showTitle;
  final double titleTextSize;
  final String subtitle;
  final bool showSubTitle;
  final double subTitleTextSize;

  const SimpleMovieCard(
      {Key? key,
      required this.imageUri,
      this.width = 30,
      this.height = 50,
      this.borderRadius = 10,
      this.title = "",
      this.showTitle = true,
      this.titleTextSize = 25,
      this.subtitle = "",
      this.showSubTitle = true,
      this.subTitleTextSize = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(20)),
        width: getProportionateScreenWidth(width),
        height: getProportionateScreenHeight(height),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(ApiConstants.imageBaseUrl + imageUri),
              fit: BoxFit.cover),
          boxShadow: [defaultBoxShadow],
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(borderRadius),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              showTitle ? title : "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(titleTextSize),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              showSubTitle ? subtitle : "",
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionateScreenWidth(subTitleTextSize),
              ),
            ),
          ],
        ));
  }
}
