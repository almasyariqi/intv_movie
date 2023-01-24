import 'package:flutter/material.dart';
import 'package:intv_movie/core/network/api_constants.dart';
import 'package:intv_movie/core/utils/size_config.dart';

class DNetworkImage extends StatelessWidget {
  final double width;
  final double height;
  final String uri;
  final BoxFit fit;
  
  const DNetworkImage({
    Key? key,
    this.width = 30,
    this.height = 30,
    this.uri = "",
    this.fit = BoxFit.cover,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
              ApiConstants.imageBaseUrl+uri,
              width: getProportionateScreenWidth(width),
              height: getProportionateScreenHeight(height),
              fit: fit,
            );
  }
}