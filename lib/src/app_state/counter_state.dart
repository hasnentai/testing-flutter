import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _count = 0;

  get getCount => _count;

  void setCountIncrement() {
    _count++;
    notifyListeners();
  }

  void setCountDecrement() {
    _count--;
    notifyListeners();
  }
}
