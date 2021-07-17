import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:sameer_flutter_portfolio/CORE/Lamp/LEDBulb.dart';
import 'package:sameer_flutter_portfolio/CORE/Lamp/lamp_switch.dart';
import 'package:sameer_flutter_portfolio/CORE/Lamp/lamp_switch_rope.dart';

import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

final darkGray = const Color(0xFF232323);
final bulbOnColor = const Color(0xFFFFE12C);
final bulbOffColor = const Color(0xFFC1C1C1);
final animationDuration = const Duration(milliseconds: 500);
bool _isSwitchOn = false;

class SplashScreen extends StatefulWidget {
  static const String TAG = "SplashScreen";
  static const String Route = "/";
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final uiModel = Provider.of<CursorProvider>(context);

    return Scaffold(
        key: globalKey,
        body: MouseRegion(
            cursor: SystemMouseCursors.basic,
            onHover: (event) {
              uiModel.setPointerPosition(event.position);
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 24, 34, 59),
                ),
                //color: _isSwitchOn ? Colors.black : Colors.transparent,
                child: Stack(
                  children: [
                    /*LampHangerRope(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  color: darkGray,
                  isSwitchOn: _isSwitchOn,
                ),*/
                    LEDBulb(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      onColor: bulbOnColor,
                      offColor: bulbOffColor,
                      isSwitchOn: _isSwitchOn,
                    ),
                    LampSwitch(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      toggleOnColor: bulbOnColor,
                      toggleOffColor: bulbOffColor,
                      color: darkGray,
                      isSwitchOn: _isSwitchOn,
                      onTap: () {
                        setState(() {
                          _isSwitchOn = !_isSwitchOn;
                        });
                      },
                      animationDuration: animationDuration,
                    ),
                    LampSwitchRope(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      color: darkGray,
                      isSwitchOn: _isSwitchOn,
                      animationDuration: animationDuration,
                    ),
                    /* Name(
                      screenWidth: screenWidth,
                      screenHeight: screenWidth,
                      color: darkGray,
                      roomName: "Turn on the light",
                    ),*/
                  ],
                ))));
  }
}
