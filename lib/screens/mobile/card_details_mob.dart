import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:x9_concierge/constants/mediaquery.dart';

class CardDetailsMob extends StatelessWidget {
  final String cardImage;
  final String title;
  final List<String> core;

  const CardDetailsMob({
    super.key,
    required this.cardImage,
    required this.core,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: md.screenWidth,
            height: md.screenHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF000000),
                  Color(0xFF2E2E2E),
                  Color(0xFF757575),
                  Color(0xFFD9D9D9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Shimmer overlay
          Positioned.fill(
            child:
                AnimatedContainer(
                      duration: const Duration(seconds: 10),
                      curve: Curves.easeInOut,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF000000),
                            Color(0xFF2E2E2E),
                            Color(0xFF757575),
                            Color(0xFFD9D9D9),
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

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      cardImage,
                      width: md.screenWidth * 0.8,
                      height: md.screenHeight * 0.2,
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

              SizedBox(height: md.screenHeight * 0.04),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left: Card Image
                  SizedBox(width: md.screenWidth * 0.04),

                  // Right: Core Services list
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: md.screenWidth * 0.04,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),

                        SizedBox(height: md.screenHeight * 0.03),

                        ...core
                            .map(
                              (item) => Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "• ",
                                      style: TextStyle(
                                        color: Color(0xFFFFD700), // GOLD bullet
                                        fontSize: 20,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: md.screenWidth * 0.03,
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
        ],
      ),
    );
  }
}
