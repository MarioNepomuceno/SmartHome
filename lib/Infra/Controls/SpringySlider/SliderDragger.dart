import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliderDragger extends StatefulWidget {
  final double initialSliderPercent;
  final Function(double sliderPercent) onSliderChange;
  final Widget child;

  const SliderDragger({
    Key key,
    this.child,
    this.onSliderChange,
    this.initialSliderPercent = 0,
  }) : super(key: key);

  _SliderDraggerState createState() => _SliderDraggerState();
}

class _SliderDraggerState extends State<SliderDragger> {
  double sliderPercent;
  double startDragY;
  double startDragPercent;

  @override
  void initState() {
    super.initState();
    sliderPercent = widget.initialSliderPercent;
  }

  void _onPanStart(DragStartDetails details) {
    startDragY = details.globalPosition.dy;
    startDragPercent = sliderPercent;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    final dragDistance = startDragY - details.globalPosition.dy;
    final sliderHeigth = context.size.height;
    final dragPercent = dragDistance / sliderHeigth;

    sliderPercent = startDragPercent + dragPercent;
    if (widget.onSliderChange != null) {
      widget.onSliderChange(sliderPercent);
    }
  }

  void _onPanEnd(DragEndDetails details) {
    startDragY = null;
    startDragPercent = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: widget.child,
    );
  }
}
