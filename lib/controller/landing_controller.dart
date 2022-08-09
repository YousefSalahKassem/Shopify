import 'package:flutter/material.dart';

class LandingController with ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  changeTab(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}