import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:x9_concierge/controller/hover_provider.dart';



class CommunityButton extends StatelessWidget {
  const CommunityButton({super.key});

  @override
  Widget build(BuildContext context) {
    final hoverProvider = Provider.of<HoverProvider>(context);
    final isHoveringCommunity = hoverProvider.isHoveringCommunity;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: MouseRegion(
          onEnter: (_) => hoverProvider.setHoveringCommunity(true),
          onExit: (_) => hoverProvider.setHoveringCommunity(false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: isHoveringCommunity
                  ? const LinearGradient(
                      colors: [Color(0xFFFFD700), Color(0xFFFFF59D)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5,
              ),
              boxShadow: isHoveringCommunity
                  ? [
                      BoxShadow(
                        color: Colors.yellowAccent.withOpacity(0.5),
                        blurRadius: 25,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: Text(
              "X9 COMMUNITY",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
                color: isHoveringCommunity
                    ? Colors.black
                    : Colors.white.withOpacity(0.85),
              ),
            ),
          ).animate().fadeIn(delay: 1.2.seconds, duration: 1.seconds),
        ),
      ),
    );
  }
}
