import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RippleAnimation extends StatefulWidget {
  @override
  _RippleAnimationState createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.9,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _buildContainer(200 * _controller.value),
            _buildContainer(250 * _controller.value),
            _buildContainer(300 * _controller.value),
          ],
        );
      },
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(1 - _controller.value),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
