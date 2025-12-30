import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:x9_concierge/constants/mediaquery.dart';
import 'package:x9_concierge/screens/widgets/background.dart';

class CardDetails extends StatelessWidget {
  final String title;
  final String cardImage;
  final List<String> core;

  const CardDetails({super.key, required this.cardImage, required this.core, required this.title});

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);

    return Scaffold(
      body: Stack(
        children: [
          BackgroundLayer(),

          Positioned.fill(
            child: Opacity(
              opacity: 0.15,
              child: Image.asset(
                "assets/x9_bg.jpg", // your asset image
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          
          Row(
            
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ).animate().fadeIn(duration: 500.ms).slideY(),

            ],
          ),

          

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: md.screenWidth * 0.08,
              vertical: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left: Card Image
                    ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            cardImage,
                            width: md.screenWidth * 0.35,
                            height: md.screenHeight * 0.35,
                            fit: BoxFit.cover,
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 900.ms, curve: Curves.easeOut)
                        .slideX(
                          begin: -0.4,
                          end: 0,
                          duration: 900.ms,
                          curve: Curves.easeOut,
                        )
                        .scale(
                          begin: const Offset(0.95, 0.95),
                          end: const Offset(1, 1),
                          duration: 900.ms,
                        ),

                    SizedBox(width: md.screenWidth * 0.06),

                    // Right: Core Services list
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Core Services",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            ),
                          ).animate().fadeIn(duration: 500.ms).slideY(),

                          SizedBox(height: 20),

                          ...core
                              .map(
                                (item) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "• ",
                                        style: TextStyle(
                                          color: Color(
                                            0xFFFFD700,
                                          ), // GOLD bullet
                                          fontSize: 20,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            height: 1.5,
                                            letterSpacing: 0.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList()
                              .animate(interval: 80.ms)
                              .fadeIn(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
