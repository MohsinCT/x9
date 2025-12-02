import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:x9_concierge/constants/mediaquery.dart';
import 'package:x9_concierge/controller/x9_landing_controller.dart';

class X9MembershipCardMOB extends StatelessWidget {
  final int index;
  final String title;
  final String cardImage;
  final String subtitle;
  final Gradient gradient;

  const X9MembershipCardMOB({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.gradient,
    required this.cardImage,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<X9LandingProvider>();
    final isHovered = provider.isHovered(index);
    final md = MediaQueryHelper(context);

    return  Container(
         width: md.screenWidth * 0.8, 
          height: md.screenHeight * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              blurRadius: 25,
              offset: const Offset(0, 8),
            ),
            if (isHovered)
              BoxShadow(
                color: const Color.fromARGB(255, 139, 44, 44).withOpacity(0.15),
                blurRadius: 40,
                spreadRadius: 8,
              ),
          ],
        ),
        child: Stack(
          children: [
            _buildOverlay(),
            _buildCardImage(),

            if (isHovered) _buildHoverOverlay(),
            _buildLogo(context),
          ],
        ),
      );
    
  }

  Widget _buildCardImage() {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Image.asset(cardImage, width: 700, fit: BoxFit.cover),
    );
  }

  Widget _buildOverlay() => Positioned.fill(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white.withOpacity(0.08), Colors.transparent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    ),
  );

  Widget _buildHoverOverlay() => Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.55),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        "• Exclusive Access\n• Concierge Services\n• Personalized Perks",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: 15,
          height: 1.6,
        ),
      ),
    ).animate().fadeIn(duration: 400.ms),
  );

  Widget _buildLogo(BuildContext context){
    final md = MediaQueryHelper(context);
    return Positioned(
    left: 20,
    bottom: 15,
    child: SizedBox(
      width: 44,
      height: 22,
      child: Image.asset('assets/Logo_Logomark_black.png'),
    ),
  );
}
}
