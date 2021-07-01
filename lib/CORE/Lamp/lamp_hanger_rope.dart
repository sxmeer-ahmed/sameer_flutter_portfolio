import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';

class LampHangerRope extends StatelessWidget {
  final double screenWidth, screenHeight;
  final Color color;
  final bool isSwitchOn;

  const LampHangerRope({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.color,
    @required this.isSwitchOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        left: screenWidth * 0.425,
        top: isSwitchOn ? 0 : -250,
        child: Image(
          image: AssetImage('assets/images/lamp.png'),
          height: 250,
          width: 250,
        ),
      ),
      Positioned(
          left: screenWidth * 0.280,
          top: isSwitchOn ? 250 : -250,
          child: GlowText('WELCOME',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 100,
                  fontFamily: "cartoon",
                  fontWeight: FontWeight.bold))),
      Positioned(
          left: screenWidth * 0.450,
          top: isSwitchOn ? 400 : -250,
          child: GlowText('TO',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 100,
                  fontFamily: "cartoon",
                  fontWeight: FontWeight.bold))),
      Positioned(
          left: screenWidth * 0.150,
          top: isSwitchOn ? 600 : -250,
          child: GlowText('MY PORTFOLIO',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 100,
                  fontFamily: "cartoon",
                  fontWeight: FontWeight.bold))),
    ]);

    /*Positioned(
      left: screenWidth *0.485,
      child: Container(
        color: color,
        width: 15,
        height: screenHeight * 0.10,
      ),
    );*/
  }
}
