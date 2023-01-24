import 'package:flutter/material.dart';

class DBottomNavigationBarItem {
  DBottomNavigationBarItem({
    required this.icon,
    required this.title,
    this.activeColor = Colors.black,
    this.textAlign,
    this.inactiveColor = Colors.black,
    this.iconPosition = MainAxisAlignment.center,
  });

  final IconData icon;
  final Widget title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
  final MainAxisAlignment iconPosition;
}