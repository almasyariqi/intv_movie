import 'package:flutter/material.dart';
import 'package:intv_movie/core/shared-widget/bottom-nav-bar/d_bottom_navigation_bar_item.dart';
import 'package:intv_movie/core/shared-widget/bottom-nav-bar/item_widget.dart';
import 'package:intv_movie/core/utils/size_config.dart';

class DBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<DBottomNavigationBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;

  // ignore: prefer_const_constructors_in_immutables
  DBottomNavigationBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 20,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 72,
    this.animationDuration = const Duration(milliseconds: 200),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: EdgeInsets.only(
            bottom: getProportionateScreenHeight(20),
            top: getProportionateScreenHeight(20),
            left: selectedIndex == 1 || selectedIndex == 2
                ? getProportionateScreenWidth(10)
                : getProportionateScreenWidth(20),
            right: selectedIndex == 1 || selectedIndex == 0
                ? getProportionateScreenWidth(10)
                : getProportionateScreenWidth(20),
          ),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}