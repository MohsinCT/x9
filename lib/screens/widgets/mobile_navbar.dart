import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x9_concierge/constants/mediaquery.dart';
import 'package:x9_concierge/controller/menu_controller.dart';


class MobileNavBar extends StatelessWidget {
  const MobileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);
    final menu = Provider.of<MobileNavProvider>(context);

    return Column(
      children: [
        // ---- TOP NAV BAR ----
        Container(
          width: md.screenWidth * 0.92,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.18),
                Colors.white.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // LOGO
              Row(
                children: [
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: Image.asset('assets/Logo_Logomark_silver.png'),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "X9 Concierge",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              // HAMBURGER
              GestureDetector(
                onTap: () => menu.toggleMenu(),
                child: Icon(
                  menu.isOpen ? Icons.close : Icons.menu,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),

        // ---- DROPDOWN MENU ----
        if (menu.isOpen)
          Container(
            width: md.screenWidth * 0.92,
            padding: const EdgeInsets.symmetric(vertical: 15),
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.55),
            ),
            child: Column(
              children: [
                MobileItem("Home", menu),
                Divider(color: Colors.white.withOpacity(0.2)),
                MobileItem("About", menu),
                Divider(color: Colors.white.withOpacity(0.2)),
                MobileItem("Services", menu),
                Divider(color: Colors.white.withOpacity(0.2)),
                MobileItem("Contact", menu),
              ],
            ),
          ),
      ],
    );
  }
}

class MobileItem extends StatelessWidget {
  final String title;
  final MobileNavProvider menu;

  const MobileItem(this.title, this.menu, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        menu.closeMenu();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.2,
            color: Colors.white.withOpacity(0.95),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
