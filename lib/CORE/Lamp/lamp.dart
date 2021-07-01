import 'package:flutter/material.dart';

class Lamp extends StatelessWidget {
  final double screenWidth, screenHeight;
  final Color color, gradientColor;
  final bool isSwitchOn;
  final Duration animationDuration;

  const Lamp({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.color,
    @required this.isSwitchOn,
    @required this.gradientColor,
    this.animationDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth * 0.110,
      top: screenHeight * 0.30,
      width: screenWidth * 0.8,
      child: ClipPath(
        clipper: TrapezoidClipper(),
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              duration: animationDuration,
              height: screenHeight * 0.75,
              decoration: BoxDecoration(
                gradient: isSwitchOn
                    ? LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.01)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width * 0.43, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.57, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
