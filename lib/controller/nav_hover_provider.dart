import 'package:flutter/material.dart';

class HoverNavProvider extends ChangeNotifier {
  String _hoveredItem = '';

  String get hoveredItem => _hoveredItem;

  void setHover(String item) {
    _hoveredItem = item;
    notifyListeners();
  }

  void clearHover() {
    _hoveredItem = '';
    notifyListeners();
  }
}
