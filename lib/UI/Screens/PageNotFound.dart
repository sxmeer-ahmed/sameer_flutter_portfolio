import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sameer_flutter_portfolio/CORE/Utils.dart';
import 'package:sameer_flutter_portfolio/UI/Screens/HomePage.dart';

class PageNotFound extends StatelessWidget {
  static const String Route = "/404";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You're lost - go home.",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Utils.getHeight(context) / 10),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: IconButton(
                icon: Icon(Icons.arrow_forward),
                color: Colors.white,
                iconSize: 50,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, HomePage.Route,
                      (c) {
                    return false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
