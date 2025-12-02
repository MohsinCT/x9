import 'package:flutter/material.dart';

class MembershipProvider with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setIndex(int index) {
    _currentPage = index;
    notifyListeners();
  }
}
