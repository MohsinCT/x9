import 'package:flutter/material.dart';

class MobileNavProvider extends ChangeNotifier {
  bool _isOpen = false;

  bool get isOpen => _isOpen;

  void toggleMenu() {
    _isOpen = !_isOpen;
    notifyListeners();
  }

  void closeMenu() {
    _isOpen = false;
    notifyListeners();
  }
}
