import 'dart:math';

import 'package:flutter/material.dart';

class TaskChart extends StatelessWidget {
  /// Assumed to be between 0 and 1
  final double completedPercent;

  /// The square size of the circle, ie box size containing circle
  final double size;

  const TaskChart({
    @required this.completedPercent,
    @required this.size,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: <Widget>[
            CustomPaint(
              painter: _GaugePainter(
                percent: completedPercent,
                completeColor: Theme.of(context).accentColor,
                circleColor: Theme.of(context).bottomAppBarColor,
              ),
              size: Size.square(size),
            ),
            Center(
              child: Text('${(completedPercent * 100).toStringAsFixed(0)} %'),
            ),
          ],
        ),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double percent;
  final Color circleColor;
  final Color completeColor;

  _GaugePainter({
    @required this.percent,
    @required this.circleColor,
    @required this.completeColor,
  }) : super();

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width * 0.5;
    double strokeWidth = size.width * 0.2;

    Paint circle = Paint()
      ..strokeWidth = strokeWidth
      ..color = circleColor
      ..style = PaintingStyle.stroke;

    Paint completedArc = Paint()
      ..strokeWidth = strokeWidth
      ..color = completeColor
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double angle = 2 * pi * percent;
    Rect rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(center, radius, circle);
    canvas.drawArc(rect, -pi * 0.5, angle, false, completedArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
