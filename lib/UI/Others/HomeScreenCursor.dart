import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:provider/provider.dart';

class HomeScreenCursor extends StatefulWidget {
  @override
  _HomeScreenCursorState createState() => _HomeScreenCursorState();
}

class _HomeScreenCursorState extends State<HomeScreenCursor>
    with SingleTickerProviderStateMixin {
  AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        rotationController.repeat();
      }
    });
    rotationController.forward();
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cursorProvider = Provider.of<CursorProvider>(context);
    return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
        child: SizedBox(
          width: 400,
          height: 400,
          child: Stack(
            children: [
              CircularText(
                children: [
                  TextItem(
                    text: Text(
                      "Sameer Ahmed".toUpperCase(),
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sharpgro',
                      ),
                    ),
                    space: 7,
                    startAngle: 0,
                  ),
                  TextItem(
                    text: Text(
                      "Android &".toUpperCase(),
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sharpgro',
                      ),
                    ),
                    space: 7,
                    startAngle: 98,
                  ),
                  TextItem(
                    text: Text(
                      "Flutter Engineer".toUpperCase(),
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sharpgro',
                      ),
                    ),
                    space: 7,
                    startAngle: 170,
                  ),
                  TextItem(
                    text: Text(
                      "from Delhi".toUpperCase(),
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'sharpgro',
                      ),
                    ),
                    space: 7,
                    startAngle: -73,
                  ),
                ],
                radius: 200,
                position: CircularTextPosition.inside,
                backgroundPaint: Paint()..color = Colors.transparent,
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: 240,
                  width: 240,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(120)),
                      border: Border.all(
                          width: cursorProvider.isHoveringLinks ? 5 : 15,
                          color: Colors.white,
                          style: BorderStyle.solid)),
                  child: Center(
                      child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 400),
                    child: Text("Hola!"),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: cursorProvider.isHoveringLinks ? 80 : 60,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              )
            ],
          ),
        ));
  }
}
