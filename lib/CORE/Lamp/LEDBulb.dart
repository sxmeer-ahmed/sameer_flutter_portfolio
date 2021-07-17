import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/HomePage.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LEDBulb extends StatelessWidget {
  final double screenWidth, screenHeight;
  final Color color, onColor, offColor;
  final bool isSwitchOn;
  final Duration animationDuration = const Duration(milliseconds: 500);

  const LEDBulb(
      {Key key,
      this.screenWidth,
      this.screenHeight,
      this.color,
      this.onColor,
      this.offColor,
      this.isSwitchOn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cursorProvider = Provider.of<CursorProvider>(context);

    return Stack(children: [
      /*isSwitchOn
          ? Positioned(
              //left: 0,
              child: Container(
              color: Color.fromARGB(255, 24, 34, 59),
              width: screenWidth * 0.405,
            ))
          : Container(),*/
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Color.fromARGB(255, 40, 61, 108),
            height: screenHeight * 0.136,
          )),
      Positioned(
          left: screenWidth * 0.15,
          bottom: 0,
          child: Visibility(
            visible: true,
            child: Image(
              image: AssetImage('assets/images/3.gif'),
              height: screenHeight * 0.71,
              width: screenWidth * 0.71,
            ),
          )),
      isSwitchOn
          ? Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: screenHeight / 15.5, left: 40),
                  child: AutoSizeText(
                    'WELCOME',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 5,
                      fontFamily: "wide",
                      fontSize: 80 * screenWidth / 1350,
                    ),
                  )))
          : Container(),
      isSwitchOn
          ? Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: screenHeight / 7.3, left: 40),
                  child: AutoSizeText(
                    '\nTO MY',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 5,
                      fontFamily: "wide",
                      fontSize: 40 * screenWidth / 1350,
                    ),
                  )))
          : Container(),
      isSwitchOn
          ? Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: screenHeight / 7.5, left: 40),
                  child: AutoSizeText(
                    '\nPORTFOLIO',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 5,
                      fontFamily: "wide",
                      fontSize: 90 * screenWidth / 1400,
                    ),
                  )))
          : Container(),
      /*!isSwitchOn
          ? Positioned(
              left: screenWidth * 0.01,
              top: screenHeight * 0.1,
              child: GlowText(
                'TURN \nON \nTHE \nLIGHT',
                // glowColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 5,
                  fontFamily: "wide",
                  fontSize: 130,
                ),
              ))
          : Container(),*/

      /*!isSwitchOn
          ? Positioned(
              left: screenWidth * 0.530,
              top: screenHeight * 0.350,
              child: GlowText(
                'TO MY',
                glowColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "cartoon",
                  fontSize: 115,
                ),
              ))
          : Container(),
      !isSwitchOn
          ? Positioned(
              left: screenWidth * 0.420,
              top: screenHeight * 0.650,
              child: GlowText(
                'PORTFOLIO',
                glowColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "cartoon",
                  fontSize: 95,
                ),
              ))
          : Container(),*/
      isSwitchOn
          ? Padding(
              padding: EdgeInsets.all(30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedButton.strip(
                  onPress: () {
                    Navigator.of(context).pushReplacement(
                      PageTransition(
                          duration: const Duration(milliseconds: 2000),
                          type: PageTransitionType.rippleMiddle,
                          child: HomePage()),
                    );
                  },
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.05,
                  text: 'ENTER',
                  isReverse: true,
                  selectedTextColor: cursorProvider.isHoveringLinks
                      ? Colors.black
                      : Colors.white,
                  stripTransitionType: StripTransitionType.LEFT_TO_RIGHT,
                  selectedBackgroundColor: cursorProvider.isHoveringLinks
                      ? Colors.white
                      : Colors.black,
                  textStyle: TextStyle(
                      fontFamily: "wide",
                      fontSize: 12,
                      letterSpacing: 5,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                ),
              ))
          : Container(),
    ]);
  }
}
