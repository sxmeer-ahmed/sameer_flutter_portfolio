import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool isMobileView(BuildContext context) {
    return getWidth(context) < 700 || getHeight(context) > getWidth(context);
  }

  static double getCursorMainScreenWithRangeW(double da, BuildContext context) {
    return (((da) * (getWidth(context) - 400)) / (getWidth(context)));
  }

  static double getCursorMainScreenWithRangeH(double da, BuildContext context) {
    return (((da) * (getHeight(context) - 400)) / (getHeight(context)));
  }

  //(((OldValue - OldMin) * (NewMax - NewMin)) / (OldMax - OldMin)) + NewMin
  static double getBarPositionFromLeft(
      double scrollOffset, double allItemsWidth, BuildContext context) {
    return convertRange(
        0, allItemsWidth, 100, getWidth(context) - 100, scrollOffset);
  }

  static double convertRange(
      double originalStart,
      double originalEnd,
      double newStart,
      double newEnd, // desired range
      double value) // value to convert
  {
    double scale = (newEnd - newStart) / (originalEnd - originalStart);
    return (newStart + ((value - originalStart) * scale));
  }

  static launchURL(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static launchEmail(String url) async {
    var _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: url,
    );
    launchURL(_emailLaunchUri.toString());
  }
}
