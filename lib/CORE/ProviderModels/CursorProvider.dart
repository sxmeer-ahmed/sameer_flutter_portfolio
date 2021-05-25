import 'package:flutter/material.dart';

class CursorProvider extends ChangeNotifier {
  ///HomeScreen Logo Animation
  bool isLogoHovering = false;

  setIsLogoHovering(bool da) {
    isLogoHovering = da;
    notifyListeners();
  }

  ///Hover Effect Cursor
  Offset pointerPosition = Offset(600, 500);

  setPointerPosition(Offset da) {
    pointerPosition = da;
    notifyListeners();
  }

  ///Hover on Drawer Items
  int currentHoverItem = 0;

  setCurrentHoverItem(int da) {
    currentHoverItem = da;
    notifyListeners();
  }

  bool isHoveringNameInAbout = false;

  setIsHoveringNameInAbout(bool da) {
    isHoveringNameInAbout = da;
    notifyListeners();
  }

  bool isHoveringMoreDetails = false;

  setIsHoveringMoreDetails(bool da) {
    isHoveringMoreDetails = da;
    notifyListeners();
  }

  bool isHoveringLinks = false;

  setIsHoveringLinks(bool boom){
    isHoveringLinks = boom;
    notifyListeners();
  }
}
