import 'package:flutter/material.dart';

class ThemeService with ChangeNotifier {
  bool isDarkTheme = false;

  toggleTheme() {
    print('toggling theme');
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}