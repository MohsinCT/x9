import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart'
    show CarouselSlider, CarouselOptions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class X9LandingPage extends StatefulWidget {
  const X9LandingPage({super.key});

  @override
  State<X9LandingPage> createState() => _X9LandingPageState();
}

class _X9LandingPageState extends State<X9LandingPage> {
  bool isHoveringCommunity = false;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // 🌌 Animated Luxury Background (kept from previous version)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0B0C10), // Deep charcoal
                  Color(0xFF1A1A2E), // Midnight indigo
                  Color(0xFF2D1B4E), // Royal violet undertone
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Soft light overlay
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
          // Shimmering background motion
          Positioned.fill(
            child:
                AnimatedContainer(
                      duration: const Duration(seconds: 10),
                      curve: Curves.easeInOut,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF0B0C10),
                            Color(0xFF1F1C2C),
                            Color(0xFF2D1B4E),
                            Color(0xFF0B0C10),
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

          // ✨ Foreground content
          Stack(
            alignment: Alignment.center,
            children: [
              // Navbar (with dark shadow)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 25,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF00C6FF),
                                      Color(0xFF0072FF),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "X9",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(
                              LucideIcons.menu,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Center content
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Premium Cards
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCard(
                              title: 'GOLD',
                              subtitle: 'Elite Member Access',
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFFE082),
                                  Color(0xFFFFD54F),
                                  Color(0xFFFFB300),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 1800.ms)
                            .moveX(begin: -100, end: 0),

                        SizedBox(width: media.width * 0.04),

                        _buildCard(
                              title: 'PLATINUM',
                              subtitle: 'Global Tier Access',
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFE0E0E0),
                                  Color(0xFFB0BEC5),
                                  Color(0xFFCFD8DC),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 1800.ms)
                            .moveY(begin: -100, end: 0),

                        SizedBox(width: media.width * 0.04),

                        _buildCard(
                              title: 'BLACK',
                              subtitle: 'Signature Membership',
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF000000),
                                  Color(0xFF1A1A1A),
                                  Color(0xFF434343),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 1800.ms)
                            .moveX(begin: 100, end: 0),

                        _buildCard(
                              title: 'SILVER',
                              subtitle: 'Elite Member Access',
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFDFDFDF), // base silver
                                  Color(0xFFBEBEBE), // deeper tone
                                  Color(0xFFE8E8E8), // light reflection
                                  Color(0xFF9E9E9E), // metallic shadow
                                ],
                                stops: [0.0, 0.35, 0.7, 1.0],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            )
                            .animate()
                            .fadeIn(duration: 2000.ms)
                            .moveX(begin: -80, end: 0),
                      ],
                    ),
                  ),

                  const SizedBox(height: 80),

                  // X9 COMMUNITY text (hover highlight)
                  MouseRegion(
                    onEnter: (_) => setState(() => isHoveringCommunity = true),
                    onExit: (_) => setState(() => isHoveringCommunity = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 14,
                      ),
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
                    ),
                  ).animate().fadeIn(delay: 1.2.seconds, duration: 1.seconds),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required Gradient gradient,
  }) {
    bool isHovered = false;

    return StatefulBuilder(
      builder: (context, setInnerState) {
        return MouseRegion(
          onEnter: (_) => setInnerState(() => isHovered = true),
          onExit: (_) => setInnerState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 420,
            height: 250,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 25,
                  offset: const Offset(0, 8),
                ),
                if (isHovered)
                  BoxShadow(
                    color: Colors.white.withOpacity(0.15),
                    blurRadius: 40,
                    spreadRadius: 8,
                  ),
              ],
            ),
            child: Stack(
              children: [
                // Light reflection overlay
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.08),
                              Colors.transparent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Main card text
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.85),
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                // Hover content
                if (isHovered)
                  Center(
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
                  ),

                // Partial logo bottom-left
                Positioned(
                  left: 20,
                  bottom: 15,
                  child: Row(
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "X9",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// void main() {
//   runApp(const X9CarouselApp());
// }

// class X9CarouselApp extends StatelessWidget {
//   const X9CarouselApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: X9CarouselPage(),
//     );
//   }
// }

class X9CarouselPage extends StatefulWidget {
  const X9CarouselPage({super.key});

  @override
  State<X9CarouselPage> createState() => _X9CarouselPageState();
}

class _X9CarouselPageState extends State<X9CarouselPage> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  final List<Map<String, dynamic>> cardData = [
    {
      'title': 'Platinum',
      'subtitle': 'Luxury Experience',
      'gradient': const LinearGradient(
        colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
    {
      'title': 'Gold',
      'subtitle': 'Premium Access',
      'gradient': const LinearGradient(
        colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
    {
      'title': 'Silver',
      'subtitle': 'Essential Benefits',
      'gradient': const LinearGradient(
        colors: [Color(0xFFC0C0C0), Color(0xFF808080)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0e0e0e),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: cardData.length,
              options: CarouselOptions(
                height: 400,
                enlargeCenterPage: true,
                viewportFraction: 0.45,
                enableInfiniteScroll: false,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  setState(() => _current = index);
                },
              ),
              itemBuilder: (context, index, realIdx) {
                final isActive = index == _current;
                final item = cardData[index];

                return AnimatedPadding(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.symmetric(
                    vertical: isActive ? 10 : 30,
                    horizontal: isActive ? 6 : 20,
                  ),
                  curve: Curves.easeOut,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    decoration: BoxDecoration(
                      boxShadow: [
                        if (isActive)
                          BoxShadow(
                            color: Colors.white.withOpacity(0.25),
                            blurRadius: 30,
                            spreadRadius: 3,
                          )
                        else
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 20,
                          ),
                      ],
                    ),
                    child: _buildCard(
                      title: item['title'],
                      subtitle: item['subtitle'],
                      gradient: isActive
                          ? item['gradient'] // keep full gradient when active
                          : LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(0.2),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cardData.asMap().entries.map((entry) {
                final isActive = _current == entry.key;
                return Container(
                  width: isActive ? 17 : 8,
                  height: isActive ? 12 : 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? Colors.deepPurpleAccent : Colors.white24,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Your provided card with hover animation
  Widget _buildCard({
    required String title,
    required String subtitle,
    required Gradient gradient,
  }) {
    bool isHovered = false;

    return StatefulBuilder(
      builder: (context, setInnerState) {
        return MouseRegion(
          onEnter: (_) => setInnerState(() => isHovered = true),
          onExit: (_) => setInnerState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 540,
            height: 600,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 25,
                  offset: const Offset(0, 8),
                ),
                if (isHovered)
                  BoxShadow(
                    color: Colors.white.withOpacity(0.15),
                    blurRadius: 40,
                    spreadRadius: 8,
                  ),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.08),
                              Colors.transparent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.85),
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isHovered)
                  Center(
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
                  ),
                Positioned(
                  left: 20,
                  bottom: 15,
                  child: Row(
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "X9",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

 // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          //     decoration: const BoxDecoration(
          //       color: Colors.transparent, // fully transparent
          //       boxShadow: [], // no shadow
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Row(
          //           children: [
          //             SizedBox(
          //               width: 38,
          //               height: 38,
          //               child: Image.asset('assets/Logo_Logomark_silver.png'),
          //             ),
          //              SizedBox(width: md.screenWidth * 0.4),
          //              Text(
          //               "X9 Concierge",
          //               style: TextStyle(
          //                 fontFamily: 'Poppins',
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: md.screenWidth * 0.01,
          //                 color: Colors.white,
          //                 letterSpacing: 2,
          //               ),
          //             ),
          //           ],
          //         ),
          //         IconButton(
          //           icon: const Icon(
          //             LucideIcons.menu,
          //             color: Colors.white,
          //             size: 28,
          //           ),
          //           onPressed: () {},
          //         ),
          //       ],
          //     ),
          //   ),
          // ),