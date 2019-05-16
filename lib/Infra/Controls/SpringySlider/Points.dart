import 'package:flutter/material.dart';

class Points extends StatelessWidget {
  final int points;
  final bool isAboveSlider;
  final Color color;

  const Points({
    Key key,
    this.points,
    this.isAboveSlider,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double percent = points / 100;
    final double pointTextSize = 30 + (70 * percent);

    return Row(
      crossAxisAlignment:
          isAboveSlider ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        FractionalTranslation(
          translation: Offset(
            0,
            isAboveSlider ? 0.18 : -0.18,
          ),
          child: Text(
            "$points",
            style: TextStyle(
              fontSize: pointTextSize,
              color: color,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  "%",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
              Text(
                "Energia",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
