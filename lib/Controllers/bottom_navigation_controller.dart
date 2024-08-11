import 'package:flutter/material.dart';

class BottomNavController extends ChangeNotifier {
  int _selectedIndex = 3;

  int get selectedIndex => _selectedIndex;

  void selectIndex(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}