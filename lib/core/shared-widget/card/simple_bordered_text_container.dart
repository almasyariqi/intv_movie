import 'package:flutter/material.dart';
import 'package:intv_movie/core/utils/size_config.dart';

class SimpleBorderedTextContainer extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  const SimpleBorderedTextContainer({
    Key? key,
    required this.text,
    this.textSize = 15.0,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(15)),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            width: 1.0,
            color: Colors.grey.withOpacity(0.7),
          ))),
      child: Wrap(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(textSize),
              fontWeight: fontWeight,
            ),
          )
        ],
      ),
    );
  }
}
