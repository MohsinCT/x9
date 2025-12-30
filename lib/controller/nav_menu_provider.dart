import 'package:flutter/material.dart';

class NavMenuProvider extends ChangeNotifier {
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void toggle() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void close() {
    if (_isExpanded) {
      _isExpanded = false;
      notifyListeners();
    }
  }
}
