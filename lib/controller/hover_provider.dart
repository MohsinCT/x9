import 'package:flutter/material.dart';

class HoverProvider with ChangeNotifier {
  bool _isHoveringCommunity = false;
  bool _isVibrating = false;

  bool get isHoveringCommunity => _isHoveringCommunity;
  bool get isVibrating => _isVibrating;

  void setHoveringCommunity(bool value) {
    _isHoveringCommunity = value;
    notifyListeners();
  }

  void triggerVibration() async {
    _isVibrating = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 150));
    _isVibrating = false;
    notifyListeners();
  }
}
