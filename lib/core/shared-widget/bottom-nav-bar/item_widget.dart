import 'package:flutter/material.dart';
import 'package:intv_movie/core/shared-widget/bottom-nav-bar/d_bottom_navigation_bar_item.dart';
import 'package:intv_movie/core/utils/size_config.dart';

class ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final DBottomNavigationBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected
            ? getProportionateScreenWidth(120)
            : (getScreenWidth() - getProportionateScreenWidth(160)) / 2,
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color: isSelected ? item.activeColor : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: isSelected
                ? getProportionateScreenWidth(120)
                : (getScreenWidth() - getProportionateScreenWidth(160)) / 2,
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(9)),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: item.iconPosition,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  size: iconSize,
                  color: isSelected
                      ? Colors.black
                      : item.inactiveColor ?? item.activeColor,
                ),
                if (isSelected)
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(5)),
                      child: DefaultTextStyle.merge(
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(15)),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        child: item.title,
                      ),
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