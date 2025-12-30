import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SampleWebPage extends StatelessWidget {
  const SampleWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SECTION 1 — VIDEO PLACEHOLDER
            Container(
              width: double.infinity,
              height: 500,
              color: Colors.black,
              child: const Center(
                child: Text(
                  "VIDEO SECTION",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),

            // SECTION 2 — CAROUSEL CARDS
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: List.generate(5, (index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Card ${index + 1}",
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // SECTION 3 — MISSION & VISION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Our Mission",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Add your mission content here...",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "Our Vision",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Add your vision content here...",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),

            // FOOTER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              color: Colors.black,
              child: const Center(
                child: Text(
                  "FOOTER SECTION",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
