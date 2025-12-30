import 'package:flutter/material.dart';
import 'package:x9_concierge/constants/mediaquery.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);
    return SizedBox(
      
      width: md.screenWidth * 0.9,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TITLE
          Text(
            "What is X9?",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 1.1,
            ),
          ),

          const SizedBox(height: 20),

          // PARA 1
          Text(
            "X9 is a premium concierge service built for people who value time more "
            "than anything. Basically, we are a lifestyle management partner for elites. "
            "We handle everything like luxury booking and exclusive experiences so "
            "our clients can focus on what matters most. When you join X9, you receive "
            "our signature golden membership card — an elegant card that acts as your "
            "key to a completely managed lifestyle.",
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white.withOpacity(0.85),
            ),
          ),

          const SizedBox(height: 18),

          // PARA 2
          Text(
            "From last-minute reservations to curated family trips, event planning, "
            "luxury private shopping, and even urgent errands, we handle it all.",
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white.withOpacity(0.85),
            ),
          ),

          const SizedBox(height: 18),

          // PARA 3
          Text(
            "Our goal is simple: give you back your most valuable asset — time — "
            "while making every moment effortless and extraordinary.",
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white.withOpacity(0.85),
            ),
          ),

          const SizedBox(height: 25),

          // SUB-SECTION TITLE
          Text(
            "What does 'Concierge' mean?",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 1.1,
            ),
          ),

          const SizedBox(height: 12),

          // PARA 4
          Text(
            "A concierge is like a personal assistant, but for your entire lifestyle. "
            "Traditionally, concierges worked in luxury hotels, helping guests book "
            "restaurants, find tickets, or arrange special requests.",
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white.withOpacity(0.85),
            ),
          ),
        ],
      ),
    );
  }
}
