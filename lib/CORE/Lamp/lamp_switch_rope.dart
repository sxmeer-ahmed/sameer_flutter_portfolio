import 'package:flutter/material.dart';

class LampSwitchRope extends StatelessWidget {
  final double screenWidth, screenHeight;
  final Color color;
  final bool isSwitchOn;
  final Duration animationDuration;

  const LampSwitchRope(
      {Key key,
      this.screenWidth,
      this.screenHeight,
      this.color,
      this.isSwitchOn,
      this.animationDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: animationDuration,
      top: -screenHeight * 0.1,
      bottom: screenHeight * (isSwitchOn ? 0.63 : 0.68),
      width: 2,
      left: screenWidth * 0.959,
      child: Container(
        color: color,
      ),
    );
  }
}
