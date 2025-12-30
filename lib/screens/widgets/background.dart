import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:x9_concierge/constants/mediaquery.dart';

class BackgroundLayer extends StatelessWidget {
  const BackgroundLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);
    return Stack(
      children: [
        Container(
            width: md.screenWidth,
            height: md.screenHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF000000), // Black
                  Color(0xFF2E2E2E), // Gunmetal
                  Color(0xFF757575), // Brushed steel
                  Color(0xFFD9D9D9), // Silver
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  radius: 1.2,
                  colors: [Colors.white.withOpacity(0.06), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child:
                AnimatedContainer(
                      duration: const Duration(seconds: 10),
                      curve: Curves.easeInOut,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF000000), // Black
                            Color(0xFF2E2E2E), // Gunmetal
                            Color(0xFF757575), // Brushed silver
                            Color(0xFFD9D9D9), // Light silver
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    )
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: true),
                    )
                    .shimmer(delay: 0.5.seconds, duration: 8.seconds),
          ),
      ],
    );
  }
}