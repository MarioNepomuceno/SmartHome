import 'package:flutter/material.dart';

import 'SliderClipper.dart';

class SliderGoo extends StatelessWidget {
  final double sliderPercent;
  final double paddingTop;
  final double paddingBottom;
  final Widget child;

  const SliderGoo({
    Key key,
    this.sliderPercent,
    this.paddingTop,
    this.paddingBottom,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SliderClipper(
        sliderPercent,
        paddingTop,
        paddingBottom,
      ),
      child: child,
    );
  }
}
