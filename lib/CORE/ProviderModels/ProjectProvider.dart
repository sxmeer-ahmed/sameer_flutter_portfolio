import 'package:flutter/cupertino.dart';

class ProjectProvider extends ChangeNotifier {
  int currentProjectIndex = 0;

  setCurrentProjectIndex(int i) {
    currentProjectIndex = i;
    notifyListeners();
  }
}
