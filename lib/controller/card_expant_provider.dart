import 'package:flutter/material.dart';

class CardExpandProvider extends ChangeNotifier {
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void toggleExpand() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void collapse() {
    _isExpanded = false;
    notifyListeners();
  }

  void expand() {
    _isExpanded = true;
    notifyListeners();
  }
}
