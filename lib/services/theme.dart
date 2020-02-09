import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeService with ChangeNotifier {
  setTheme(String theme) {
    // theme can be 'light' or 'dark'
    var settingsBox = Hive.box('settings');
    settingsBox.put('theme', theme);
    notifyListeners(); 
    // when the function is executed the route app is rebuilt with the new theme
    // the theme is coming from the Hive settings box
  }
}