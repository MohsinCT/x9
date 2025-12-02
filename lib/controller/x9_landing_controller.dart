// x9_landing_provider.dart
import 'package:flutter/material.dart';

class X9LandingProvider with ChangeNotifier {
  int _currentIndex = 0;
  final Map<int, bool> _hoverStates = {};

  int get currentIndex => _currentIndex;
  bool isHovered(int index) => _hoverStates[index] ?? false;

  void updatePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setHover(int index, bool isHovered) {
    _hoverStates[index] = isHovered;
    notifyListeners();
  }
}

