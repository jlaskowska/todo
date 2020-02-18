import 'package:flutter/material.dart';
import 'package:todo/widgets/task_screen/task_chart.dart';

class AnimatedTaskChart extends StatefulWidget {
  final double size;
  final double completedPercent;

  AnimatedTaskChart({
    @required this.completedPercent,
    @required this.size,
    Key key,
  }) : super(key: key);

  @override
  _AnimatedTaskChartState createState() => _AnimatedTaskChartState();
}

class _AnimatedTaskChartState extends State<AnimatedTaskChart> with SingleTickerProviderStateMixin {
  static const int maximumAnimationDuration = 750;

  AnimationController _controller;
  double completedPercentage = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // firstly determine animation duration
    double difference = (completedPercentage - widget.completedPercent).abs();
    double proportionalDifference = difference / 1.0;
    int durationMS = (proportionalDifference * maximumAnimationDuration).toInt();
    _controller.duration = Duration(milliseconds: durationMS);

    // set animation
    _controller.reset();
    Animation _animation = Tween<double>(begin: completedPercentage, end: widget.completedPercent).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        completedPercentage = widget.completedPercent;
      }
    });
    _controller.forward();

    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) => TaskChart(
        completedPercent: _animation.value,
        size: widget.size,
      ),
    );
  }
}
