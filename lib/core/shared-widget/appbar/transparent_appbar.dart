import 'package:flutter/material.dart';
import 'package:intv_movie/core/utils/size_config.dart';

class TransparentAppbar extends StatelessWidget {
  const TransparentAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        width: getScreenWidth(),
        height: getProportionateScreenHeight(90),
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(15),
            horizontal: getProportionateScreenWidth(15)),
        color: Colors.transparent,
        child: SafeArea(
          child: Container(
            child: Wrap(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: getProportionateScreenWidth(30),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
