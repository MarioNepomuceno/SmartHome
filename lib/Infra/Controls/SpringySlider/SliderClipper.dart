import 'package:flutter/material.dart';

class SliderClipper extends CustomClipper<Path> {
  final double sliderPercent;
  final double paddingTop;
  final double paddingBottom;

  SliderClipper(
    this.sliderPercent,
    this.paddingTop,
    this.paddingBottom,
  );

  @override
  Path getClip(Size size) {
    final top = paddingTop;
    final bottom = size.height;
    final heigth = (bottom - paddingBottom) - top;
    final percentFromBottom = 1 - sliderPercent;

    Path rect = new Path();
    rect.addRect(new Rect.fromLTRB(
      0,
      top + (percentFromBottom * heigth),
      size.width,
      bottom,
    ));

    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
