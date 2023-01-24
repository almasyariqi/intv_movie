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
  final bool useBackground;

  const SimpleMovieCard({
    Key? key,
    required this.imageUri,
    this.width = 30,
    this.height = double.infinity,
    this.borderRadius = 10,
    this.title = "",
    this.showTitle = true,
    this.titleTextSize = 20,
    this.subtitle = "",
    this.showSubTitle = true,
    this.subTitleTextSize = 12,
    this.useBackground = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: getProportionateScreenWidth(width),
      height: getProportionateScreenHeight(height),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        image: imageUri.isNotEmpty ? DecorationImage(
          image: NetworkImage(ApiConstants.imageBaseUrl + imageUri),
          fit: BoxFit.cover,
        ) : null,
        boxShadow: [defaultBoxShadow],
        borderRadius: BorderRadius.circular(
          getProportionateScreenWidth(borderRadius),
        ),
      ),
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(15)),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(useBackground ? 0.5 : 0.0),
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(getProportionateScreenWidth(borderRadius)),
                bottomRight:
                    Radius.circular(getProportionateScreenWidth(borderRadius)),
              )),
          child: Wrap(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    showTitle ? title : "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(titleTextSize),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (showSubTitle)
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                  if (showSubTitle)
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(subTitleTextSize),
                      ),
                    ),
                ],
              )
            ],
          )),
    );
  }
}
