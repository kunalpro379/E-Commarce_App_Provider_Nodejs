import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _selectedindex = 0;

  int get selectedIndex => _selectedindex;
  void updateSelectedIndex(int index) {
    _selectedindex = index;
    notifyListeners();
  }
}
