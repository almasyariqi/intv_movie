import 'package:flutter/material.dart';

class DInkwell extends StatelessWidget {
  final Widget? child;
  final Function? onTap;
  final Color? bgColor;

  const DInkwell({
    Key? key,
    this.child,
    this.onTap,
    this.bgColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      child: InkWell(
        splashColor: Colors.grey,
        onTap: onTap as void Function()?,
        child: child,
      ),
    );
  }
}
