import 'package:flutter/material.dart';

class TotalProvider extends ChangeNotifier {
  int total = 0;

  void add(int price) {
    total += price;
    notifyListeners();
  }

  void sub(int price) {
    total -= price;
    notifyListeners();
  }

  void clearTotal() {
    total = 0;
  }
}
