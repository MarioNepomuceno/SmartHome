import 'package:flutter/material.dart';
import 'package:smarthome/Infra/Controls/SpringySlider/SliderDragger.dart';

import 'SpringMark.dart';
import 'SliderGoo.dart';
import 'SliderDragger.dart';
import 'Points.dart';

class SpringySliderWidget extends StatefulWidget {
  final int markCount;
  final Color positiveColor;
  final Color negativeColor;

  const SpringySliderWidget({
    Key key,
    this.markCount,
    this.positiveColor,
    this.negativeColor,
  }) : super(key: key);

  _SpringySliderState createState() => new _SpringySliderState();
}

class _SpringySliderState extends State<SpringySliderWidget> {
  final double paddingTop = 50;
  final double paddingBottom = 50;

  double sliderPercent = 0.50;

  @override
  Widget build(BuildContext context) {
    return SliderDragger(
      initialSliderPercent: sliderPercent,
      onSliderChange: (double sliderPercent) {
        setState(() {
          this.sliderPercent = sliderPercent;
        });
      },
      child: Stack(
        children: <Widget>[
          SliderMarks(
            markCount: widget.markCount,
            markColor: widget.positiveColor,
            backGroundColor: widget.negativeColor,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
          ),
          SliderGoo(
            sliderPercent: sliderPercent,
            paddingTop: paddingTop,
            paddingBottom: paddingBottom,
            child: SliderMarks(
              markCount: widget.markCount,
              markColor: widget.negativeColor,
              backGroundColor: widget.positiveColor,
              paddingTop: paddingTop,
              paddingBottom: paddingBottom,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: paddingTop,
              bottom: paddingBottom,
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final height = constraints.maxHeight;
                final sliderY = height * (1 - sliderPercent);
                final pointYouNeed = (100 * (1 - sliderPercent)).round();
                final pointYouHave = (100 - pointYouNeed).round();

                return Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      top: sliderY - 50,
                      child: FractionalTranslation(
                        translation: Offset(0, -1),
                        child: Points(
                          color: Theme.of(context).primaryColor,
                          points: pointYouNeed,
                          isAboveSlider: true,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: sliderY + 50,
                      child: Points(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        points: pointYouHave,
                        isAboveSlider: false,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
