import 'package:flutter/material.dart';
import 'package:intv_movie/core/utils/size_config.dart';

class RatingBoxCard extends StatelessWidget {
  final double rating;
  const RatingBoxCard({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(getProportionateScreenWidth(5)),
              bottomLeft: Radius.circular(getProportionateScreenWidth(5)),
            )),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(5),
            vertical: getProportionateScreenHeight(3)),
        child: Wrap(
          children: [
            Text(
              rating.toStringAsFixed(1),
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ));
  }
}
