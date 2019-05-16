import 'dart:ui';

import 'package:flutter/material.dart';

class SliderMarks extends StatelessWidget {
  final int markCount;
  final Color markColor;
  final Color backGroundColor;
  final double paddingTop;
  final double paddingBottom;

  const SliderMarks({
    Key key,
    this.markCount,
    this.markColor,
    this.backGroundColor,
    this.paddingTop,
    this.paddingBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: new SliderMarkPainter(
        markCount,
        markColor,
        backGroundColor,
        2,
        paddingTop,
        paddingBottom,
        20,
      ),
      child: new Container(),
    );
  }
}

class SliderMarkPainter extends CustomPainter {
  final int markCount;
  final Color markColor;
  final Color backGroundColor;
  final double markThickness;
  final double paddingTop;
  final double paddingBottom;
  final double paddingRigth;

  final double largeMarkWidth = 30;
  final double smallMarkWidth = 10;

  final Paint markPaint;
  final Paint backgroundPaint;

  SliderMarkPainter(
    this.markCount,
    this.markColor,
    this.backGroundColor,
    this.markThickness,
    this.paddingTop,
    this.paddingBottom,
    this.paddingRigth,
  )   : markPaint = new Paint()
          ..color = markColor
          ..strokeWidth = markThickness
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round,
        backgroundPaint = new Paint()
          ..color = backGroundColor
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ),
        backgroundPaint);

    final paintHeight = size.height - paddingTop - paddingBottom;
    final gap = paintHeight / (markCount - 1);

    for (int i = 0; i < markCount; i++) {
      double markWidth = smallMarkWidth;
      if (i == 0 || i == markCount - 1) {
        markWidth = largeMarkWidth;
      } else if (i == 1 || i == markCount - 2) {
        markWidth = lerpDouble(
          smallMarkWidth,
          largeMarkWidth,
          0.5,
        );
      }

      final markY = i * gap + paddingTop;

      canvas.drawLine(
        new Offset(size.width - paddingRigth - markWidth, markY),
        new Offset(size.width - paddingRigth, markY),
        markPaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
