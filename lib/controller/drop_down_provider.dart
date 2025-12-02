import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  bool isMenuOpen = false;
  String searchQuery = "";

  final List<String> menuItems = [
    "About",
    "Services",
    "Contact",
    "Portfolio",
    "Team",
    "Careers",
  ];

  void toggleMenu() {
    isMenuOpen = !isMenuOpen;
    notifyListeners();
  }

  void updateSearch(String value) {
    searchQuery = value;
    notifyListeners();
  }

  List<String> get filteredItems {
    if (searchQuery.isEmpty) return menuItems;
    return menuItems
        .where((item) => item.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }
}
