import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:x9_concierge/constants/mediaquery.dart';
import 'package:x9_concierge/controller/drop_down_provider.dart';
import 'package:x9_concierge/controller/nav_hover_provider.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);
    final menuProvider = Provider.of<MenuProvider>(context);

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // LOGO + NAME
            Row(
              children: [
                SizedBox(
                  width: 38,
                  height: 38,
                  child: Image.asset('assets/Logo_Logomark_silver.png'),
                ),
                const SizedBox(width: 12),
                Text(
                  "X9 Concierge",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: md.screenWidth * 0.014,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),

            // NAV MENU ITEMS
            Row(
              children: [
                HoverNavItem("Home", () {}),
                const SizedBox(width: 40),
                HoverNavItem("About", () {}),
                const SizedBox(width: 40),
                HoverNavItem("Services", () {}),
                const SizedBox(width: 40),
                HoverNavItem("Contact", () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HoverNavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const HoverNavItem(this.title, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    final hoverProvider = Provider.of<HoverNavProvider>(context);
    final bool isHovered = hoverProvider.hoveredItem == title;

    return MouseRegion(
      onEnter: (_) => hoverProvider.setHover(title),
      onExit: (_) => hoverProvider.clearHover(),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          style: TextStyle(
            color: isHovered ? const Color(0xFFFFD700) : Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.3,
            shadows: isHovered
                ? [
                    Shadow(
                      color: const Color(
                        0xFFFFD700,
                      ).withOpacity(0.9), // Bright gold glow
                      blurRadius: 12,
                      offset: const Offset(0, 0),
                    ),
                    Shadow(
                      color: Colors.white.withOpacity(0.6), // Soft outer glow
                      blurRadius: 18,
                      offset: const Offset(0, 0),
                    ),
                  ]
                : [],
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
