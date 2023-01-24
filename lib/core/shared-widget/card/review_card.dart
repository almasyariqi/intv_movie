import 'package:flutter/material.dart';
import 'package:intv_movie/core/shared-widget/card/rating_box_card.dart';
import 'package:intv_movie/core/shared-widget/image/d_network_image.dart';
import 'package:intv_movie/core/utils/size_config.dart';

class ReviewCard extends StatelessWidget {
  final String authorName;
  final String authorUsername;
  final String authorProfilePath;
  final double rating;
  final String content;

  const ReviewCard(
      {Key? key,
      this.authorName = "Riadi Almasyariqi",
      this.authorUsername = "almasyariqi",
      this.authorProfilePath = "",
      this.rating = 7.5,
      this.content = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
        vertical: getProportionateScreenHeight(10),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              authorProfilePath.isNotEmpty
                  ? authorProfilePath.contains('http')
                      ? Icon(
                          Icons.account_box,
                          color: Colors.blueGrey,
                          size: getProportionateScreenWidth(50),
                        )
                      : DNetworkImage(
                          uri: authorProfilePath,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        )
                  : Icon(
                      Icons.account_box,
                      color: Colors.blueGrey,
                      size: getProportionateScreenWidth(50),
                    ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              RatingBoxCard(rating: rating)
            ],
          ),
          SizedBox(
            width: getProportionateScreenWidth(15),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      authorName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(8),
                    ),
                    Text(
                      authorUsername,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: getProportionateScreenWidth(15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
