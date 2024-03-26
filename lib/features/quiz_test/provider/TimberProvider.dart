import 'package:flutter/cupertino.dart';

class TimberProvider extends ChangeNotifier {
  int time = 0;

  void setTime(int t) {
    time = t;
    notifyListeners();
  }
}
