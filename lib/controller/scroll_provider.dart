import 'package:flutter/material.dart';

class ScrollProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    final box = context.findRenderObject() as RenderBox;
    final position = box.localToGlobal(Offset.zero).dy;

    final offset = scrollController.offset + position - 80; 
    // 80 = navbar height offset

    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  void scrollToHome() => scrollTo(homeKey);
  void scrollToAbout() => scrollTo(aboutKey);
  void scrollToServices() => scrollTo(servicesKey);
  void scrollToContact() => scrollTo(contactKey);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
