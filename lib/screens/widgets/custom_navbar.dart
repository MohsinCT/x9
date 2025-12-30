import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x9_concierge/constants/mediaquery.dart';
import 'package:x9_concierge/controller/nav_hover_provider.dart';
import 'package:x9_concierge/controller/nav_menu_provider.dart';
import 'package:x9_concierge/controller/scroll_provider.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);
    final scrollPro = context.read<ScrollProvider>();

    return Positioned(
      top: 16,
      left: 0,
      right: 0,
      child: Center(
        child: Stack(
          children: [
            _fadeUnderlay(md),
            _glassNavBar(md, context, scrollPro),
          ],
        ),
      ),
    );
  }

  Widget _fadeUnderlay(MediaQueryHelper md) {
  return Container(
    width: md.isMobile ? md.screenWidth * 0.95 : md.screenWidth * 0.92,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(25),
      ),
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Colors.black.withOpacity(0.35),
          Colors.black.withOpacity(0.1),
          Colors.transparent,
        ],
      ),
    ),
  );
}

Widget _glassNavBar(
  MediaQueryHelper md,
  BuildContext context,
  ScrollProvider scroll,
) {
  final navMenu = context.watch<NavMenuProvider>();

  return AnimatedContainer(
    duration: const Duration(milliseconds: 350),
    curve: Curves.easeInOut,
    width: md.isMobile ? md.screenWidth * 0.95 : md.screenWidth * 0.92,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      border: Border.all(color: Colors.white.withOpacity(0.2)),
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.18),
          Colors.white.withOpacity(0.05),
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 12,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            _logoSection(md),
            const Spacer(),

            md.isMobile
                ? IconButton(
                    icon: AnimatedRotation(
                      turns: navMenu.isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.menu, color: Colors.white),
                    ),
                    onPressed: navMenu.toggle,
                  )
                : _desktopMenu(scroll),
          ],
        ),

        // 👇 EXPANDING AREA
        if (md.isMobile)
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: navMenu.isExpanded
                ? _mobileExpandedMenu(context, scroll)
                : const SizedBox(),
          ),
      ],
    ),
  );
}

Widget _mobileExpandedMenu(
  BuildContext context,
  ScrollProvider scroll,
) {
  final navMenu = context.read<NavMenuProvider>();

  return Padding(
    padding: const EdgeInsets.only(top: 16),
    child: Column(
      children: [
        _MobileNavItem(
          title: "Home",
          onTap: () {
            scroll.scrollToHome();
            navMenu.close();
          },
        ),
        _MobileNavItem(
          title: "About",
          onTap: () {
            scroll.scrollToAbout();
            navMenu.close();
          },
        ),
        _MobileNavItem(
          title: "Services",
          onTap: () {
            scroll.scrollToServices();
            navMenu.close();
          },
        ),
        _MobileNavItem(
          title: "Contact",
          onTap: () {
            scroll.scrollToContact();
            navMenu.close();
          },
        ),
      ],
    ),
  );
}




Widget _logoSection(MediaQueryHelper md) {
  return Row(
    children: [
      Image.asset(
        'assets/Logo_Logomark_silver.png',
        width: 36,
        height: 36,
      ),
      const SizedBox(width: 12),
      Text(
        "X9 Concierge",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontSize: md.isMobile ? 16 : 18,
          letterSpacing: 1.5,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget _desktopMenu(ScrollProvider scroll) {
  return Row(
    children:  [
      HoverNavItem("Home",  (){
        scroll.scrollToHome();
      }),
      SizedBox(width: 36),
      HoverNavItem("About", (){
        scroll.scrollToAbout();
      }),
      SizedBox(width: 36),
      HoverNavItem("Services", (){
        scroll.scrollToServices();
      }),
      SizedBox(width: 36),
      HoverNavItem("Contact", (){
        scroll.scrollToContact();
      }),
    ],
  );
}

void _noop() {}

Widget _mobileMenu(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.menu, color: Colors.white),
    onPressed: () {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.black.withOpacity(0.85),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (_) => const _MobileNavSheet(),
      );
    },
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
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            shadows: isHovered
                ? [
                    Shadow(
                      color: const Color(0xFFFFD700).withOpacity(0.9),
                      blurRadius: 12,
                      offset: const Offset(0, 0),
                    ),
                    Shadow(
                      color: Colors.white.withOpacity(0.6),
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





class _MobileNavSheet extends StatelessWidget {
  const _MobileNavSheet();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 180,
        maxWidth: 220,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _MobileNavItem(title: "Home"),
            _MobileNavItem(title: "About"),
            _MobileNavItem(title: "Services"),
            _MobileNavItem(title: "Contact"),
          ],
        ),
      ),
    );
  }
}


class _MobileNavItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const _MobileNavItem({required this.title,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}


