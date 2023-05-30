import 'package:flutter/material.dart';

class PasswordVisibility extends ChangeNotifier {
  bool visibility = false;
  void onPressed() {
    visibility = !visibility;
    notifyListeners();
  }
}
