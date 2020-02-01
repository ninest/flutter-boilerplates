import 'package:flutter/material.dart';

class CounterService with ChangeNotifier {
  int value = 0;

  increment() {
    value++;
    notifyListeners();
  }
}
