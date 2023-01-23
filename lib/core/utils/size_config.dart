import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double statusBarHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    statusBarHeight = _mediaQueryData.viewPadding.top;
    orientation = _mediaQueryData.orientation;
  }
}

double getScreenHeight(){
  return SizeConfig.screenHeight;
}

double getScreenWidth(){
  return SizeConfig.screenWidth;
}

double getStatusBarHeight(){
  return SizeConfig.statusBarHeight;
}

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 823.0) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 411.0) * screenWidth;
}