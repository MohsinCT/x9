import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:x9_concierge/constants/mediaquery.dart';
import 'package:x9_concierge/controller/hover_provider.dart';
import 'package:x9_concierge/controller/membership_provider.dart';
import 'package:x9_concierge/controller/scroll_provider.dart';
import 'package:x9_concierge/controller/video_provider.dart';
import 'package:x9_concierge/screens/card_details.dart';
import 'package:x9_concierge/screens/widgets/about_us.dart';
import 'package:x9_concierge/screens/widgets/background.dart';
import 'package:x9_concierge/screens/widgets/bullet.dart';
import 'package:x9_concierge/screens/widgets/custom_navbar.dart';
import 'package:x9_concierge/screens/widgets/glass_container.dart';
import 'package:x9_concierge/screens/widgets/platform_cards.dart';
import 'package:x9_concierge/screens/widgets/x9_footer.dart';
import 'package:x9_concierge/screens/widgets/x9membershipcard.dart';

class JustTest extends StatelessWidget {
  const JustTest({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);
    final x9Proivder = Provider.of<MembershipProvider>(context, listen: false);
    final hoverProvider = Provider.of<HoverProvider>(context, listen: false);
    final scrollPro = Provider.of<ScrollProvider>(context, listen: false);

    final cards = [
      {
        'title': ' Golden Membership Card (PVC)',
        'cardImage': 'assets/Gold.jpeg',
        'subtitle': 'Virtual EA',
        'gradient': const LinearGradient(
          colors: [Color(0xFFFFE082), Color(0xFFFFD54F), Color(0xFFFFB300)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        'core': [
          '- Daily requests, bookings & reservations (basic)',
          '- Flight & hotel bookings (standard options only)',
          '- Travel ticketing & basic itinerary support',
          '- Calendar planning & reminders for important dates',
          '- Renewal reminders (subscriptions, bills, insurance, EMI, etc.)',
          '- Pickup/drop/courier arrangements (standard-only coordination)',
          '- Assigned concierge support via standard response queue',
          '- Available Mon–Fri, 9:00 AM to 6:00 PM',
        ],
      },
      {
        'title': 'Platinum Membership Card (PVC)',
        'cardImage': 'assets/Platinum.jpeg',
        'subtitle': 'Concierge Services',
        'gradient': const LinearGradient(
          colors: [Color(0xFFE0E0E0), Color(0xFFB0BEC5), Color(0xFFCFD8DC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        'core': [
          '- Concierge Services: Daily requests, bookings, reservations.',
          '- Personlized Newsletters: Curated updates tailored to member interests',
          '- Visa & Immigration Assistance: Documentation and process support',
          '- Personl Finance Assistance:Help with financial planning and guidance',
        ],
      },

      {
        'title': 'Pearl Membership Card (PVC)',
        'cardImage': 'assets/pearl 1.jpeg',
        'subtitle': 'Family Support & Well Being',
        'gradient': const LinearGradient(
          colors: [Color(0xFFE0E0E0), Color(0xFFB0BEC5), Color(0xFFCFD8DC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        'core': [
          '- Family Care: Special support for NRIs (managing family needs locally).',
          '- Medical & Health Advisor: Guidance and access to trusted specialists.',
          '- Home & Vehicle Management: Event clean-up, maintenance coordination.',
          '- Babysitting & Elder Care: Verified caregivers as needed.',
          '- Pet & Veterinary Care: Scheduling appointments, arranging services',
          '- Psychologist / Therapist Access: Mental health and wellness support',
          '- Postpartum Care: After-delivery mental health & assistance',
          '- Personal Finance Assistance: Ongoing financial advisory support',
        ],
      },
      {
        'title': 'Black Metal Membership Card (Premium)',
        'cardImage': 'assets/Black.jpeg',
        'subtitle': 'Exclusive Access',
        'gradient': const LinearGradient(
          colors: [Color(0xFF000000), Color(0xFF1A1A1A), Color(0xFF434343)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        'core': [
          '- Luxury Travel Planning: Safaris, private tours, exotic getaways',
          '- Unique Experiences: Skydiving, scuba diving, curated adventures',
          '- Personal Tutors: Online or in-person educational support',
          '- Salon & Spa Appointments: Premium grooming & wellness services',
          '- Private Event Planning: Weddings, parties, and exclusive gatherings',
          '- Philanthropy Support: Help in finding & contributing to charities',
          '- High-Level Access: Opportunities to connect with govt. stakeholders, entrepreneurs investors',
          '- Buy & Sell Assistance: Facilitating high-value transactions',
          '- Priority Concierge: Fastest response and white-glove service',
        ],
      },
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,

        onPressed: () async {
          final url = Uri.parse("https://wa.me/919036354901"); // your number

          if (!await launchUrl(
            url,
            mode: LaunchMode.platformDefault, // web-compatible
          )) {
            throw "Could not launch WhatsApp";
          }
        },

        child: const FaIcon(
          FontAwesomeIcons.whatsapp,
          color: Colors.white,
          size: 40,
        ),
      ),

      body: Stack(
        children: [
          // 🔥 BACKGROUND LAYER (your widget)
          const BackgroundLayer(),
          Positioned.fill(
            child: Opacity(
              opacity: 0.15,
              child: Image.asset(
                "assets/x9_bg.jpg", // your asset image
                fit: BoxFit.cover,
              ),
            ),
          ),
          

          // 🔥 SCROLLABLE CONTENT ABOVE BACKGROUND
          Positioned.fill(
            //
            child: SingleChildScrollView(
              controller: scrollPro.scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: md.screenHeight * 0.03),
                   CustomNavBar(),

                  SizedBox(height: 20),
                  Positioned.fill(
                    /// VIDEO WITH GLASS EFFECT
                    ///
                    child: GlassContainer(
                      width: md.screenWidth * 0.92,
                      height: md.screenHeight * 0.8,
                      child: Stack(
                        children: [
                          /// --- VIDEO BACKGROUND ---
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                              child: Consumer<VideoProvider>(
                                builder: (context, videoPro, _) {
                                  if (!videoPro.initialized) {
                                    return const SizedBox();
                                  }

                                  return ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      Colors.transparent.withAlpha(40),
                                      BlendMode.darken,
                                    ),
                                    child: SizedBox(
                                      width: md.screenWidth * 0.96,
                                      height: md.screenHeight,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: SizedBox(
                                          width: videoPro
                                              .controller!
                                              .value
                                              .size
                                              .width,
                                          height: videoPro
                                              .controller!
                                              .value
                                              .size
                                              .height,
                                          child: VideoPlayer(
                                            videoPro.controller!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          /// --- BOTTOM FADED SHADE ---
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: md.screenHeight * 0.4,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black87,
                                    Colors.black54,
                                    Colors.black26,
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),

                          /// --- BOTTOM RIGHT CONTENT ---
                          Positioned(
                            bottom: 40,
                            right: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Redefine Time",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.95),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.2,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                /// BUTTON
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),



                  // ✨ LUXURY ABOUT-US SECTION
                  SizedBox(height: md.screenHeight * 0.1),

                  GlassContainer(
                    key: scrollPro.aboutKey,
                    width: md.isMobile
                        ? md.screenWidth * 0.95
                        : md.isTablet
                        ? md.screenWidth * 0.9
                        : md.screenWidth * 0.92,
                    height: null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// --- ABOUT US SECTION ---
                        md.isMobile
                            ? Column(
                                children: [
                                  // IMAGE ON TOP (MOBILE)
                                  Center(
                                    child: Image.asset(
                                      "assets/x9_concierge_b_trans.png",
                                      width: md.screenWidth * 0.6,
                                      height: md.screenHeight * 0.25,
                                      fit: BoxFit.contain,
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  // TEXT BELOW
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: AboutUs(),
                                  ),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: md.screenWidth * 0.06),

                                  // IMAGE LEFT (WEB)
                                  Image.asset(
                                    "assets/x9_concierge_b_trans.png",
                                    width: md.screenWidth * 0.25,
                                    scale: 3,
                                    height: md.screenHeight * 0.5,
                                    fit: BoxFit.cover,
                                  ),

                                  SizedBox(width: md.screenWidth * 0.10),

                                  // TEXT RIGHT
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: AboutUs(),
                                    ),
                                  ),
                                ],
                              ),

                        const SizedBox(height: 40),

                        /// --- AUDIENCE SECTION ---
                        md.isMobile
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // TITLE
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "Audience / Customer Profile:",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        letterSpacing: 1.1,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16),

                                  // DESCRIPTION
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "Our audience consists of busy, successful people who value time "
                                      "and convenience more than money.",
                                      style: TextStyle(
                                        fontSize: 15,
                                        height: 1.6,
                                        color: Colors.white.withOpacity(0.85),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 14),

                                  // BULLETS
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Bullet(
                                          "Entrepreneurs, CXOs, investors, HNIs, and affluent families",
                                        ),
                                        Bullet(
                                          "People who prefer seamless solutions rather than spending hours planning",
                                        ),
                                        Bullet(
                                          "People who appreciate luxury, privacy, and efficiency",
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  // IMAGE BELOW
                                  Center(
                                    child: Image.asset(
                                      "assets/men.png",
                                      width: md.screenWidth * 0.6,
                                      height: md.screenHeight * 0.25,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // LEFT TEXT
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: md.screenWidth * 0.05,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Audience / Customer Profile:",
                                            style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              letterSpacing: 1.1,
                                            ),
                                          ),

                                          const SizedBox(height: 18),

                                          Text(
                                            "Our audience consists of busy, successful people who value time "
                                            "and convenience more than money.",
                                            style: TextStyle(
                                              fontSize: 16,
                                              height: 1.6,
                                              color: Colors.white.withOpacity(
                                                0.85,
                                              ),
                                            ),
                                          ),

                                          const SizedBox(height: 16),

                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Bullet(
                                                "Entrepreneurs, CXOs, investors, HNIs, and affluent families",
                                              ),
                                              Bullet(
                                                "People who prefer seamless solutions rather than spending hours planning",
                                              ),
                                              Bullet(
                                                "People who appreciate luxury, privacy, and efficiency",
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: md.screenWidth * 0.1),

                                  // RIGHT IMAGE
                                  SizedBox(
                                    width: md.screenWidth * 0.25,
                                    height: md.screenHeight * 0.35,
                                    child: Image.asset(
                                      "assets/men.png",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),

                  //   SERVICE CARDS
                  SizedBox(height: md.screenHeight * 0.1),

                  Stack(
                    children: [
                      Column(
                        children: [
                          // CAROUSEL INSIDE GLASS CONTAINER
                          GlassContainer(
                            key:scrollPro.servicesKey,
                            width: md.isMobile
                                ? md.screenWidth * 0.95
                                : md.isTablet
                                ? md.screenWidth * 0.9
                                : md.screenWidth * 0.92,

                            height: md.isMobile
                                ? null
                                : md.isTablet
                                ? md.screenHeight * 0.7
                                : md.screenHeight * 0.8,

                            padding: EdgeInsets.symmetric(
                              horizontal: md.isMobile ? 16 : 32,
                              vertical: md.isMobile ? 24 : 48,
                            ),
                            child: md.isMobile
                                ? X9MembershipCardMobile()
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Membership Tiers & Services",
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          letterSpacing: 1.1,
                                        ),
                                      ),
                                      SizedBox(height: md.screenHeight * 0.07),
                                      CarouselSlider.builder(
                                        itemCount: cards.length,
                                        itemBuilder:
                                            (context, index, realIndex) {
                                              final card = cards[index];
                                              return X9MembershipCard(
                                                cardImage:
                                                    card['cardImage'] as String,
                                                index: index,
                                                title: card['title'] as String,
                                                subtitle:
                                                    card['subtitle'] as String,
                                                gradient:
                                                    card['gradient'] as dynamic,
                                              );
                                            },
                                        options: CarouselOptions(
                                          height: md.screenHeight * 0.3,
                                          viewportFraction: 0.36,
                                          enableInfiniteScroll: true,
                                          enlargeCenterPage: true,
                                          enlargeFactor: 0.57,
                                          autoPlay: true,
                                          onPageChanged: (index, reason) {
                                            x9Proivder.setIndex(index);
                                          },
                                        ),
                                      ),

                                      SizedBox(height: md.screenHeight * 0.08),

                                      MouseRegion(
                                        onEnter: (_) => hoverProvider
                                            .setHoveringCommunity(true),
                                        onExit: (_) => hoverProvider
                                            .setHoveringCommunity(false),
                                        child: GestureDetector(
                                          onTapDown: (_) =>
                                              HapticFeedback.lightImpact(),
                                          onTap: () {
                                            final currentCard =
                                                cards[x9Proivder.currentPage];

                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (ctx) => CardDetails(
                                                  title:
                                                      currentCard['title']
                                                          as String,
                                                  cardImage:
                                                      currentCard['cardImage']
                                                          as String,
                                                  core:
                                                      currentCard['core']
                                                          as dynamic,
                                                ),
                                              ),
                                            );

                                            HapticFeedback.mediumImpact();
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 28,
                                              vertical: 14,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              gradient:
                                                  hoverProvider
                                                      .isHoveringCommunity
                                                  ? const LinearGradient(
                                                      colors: [
                                                        Color(0xFFFFD700),
                                                        Color(0xFFFFF59D),
                                                      ],
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                    )
                                                  : null,
                                              border: Border.all(
                                                color: Colors.white.withOpacity(
                                                  0.3,
                                                ),
                                                width: 1.5,
                                              ),
                                              boxShadow:
                                                  hoverProvider
                                                      .isHoveringCommunity
                                                  ? [
                                                      BoxShadow(
                                                        color: Colors
                                                            .yellowAccent
                                                            .withOpacity(0.5),
                                                        blurRadius: 25,
                                                        spreadRadius: 2,
                                                      ),
                                                    ]
                                                  : [],
                                            ),
                                            child: Consumer<MembershipProvider>(
                                              builder: (context, x9Pro, child) {
                                                return Text(
                                                  cards[x9Pro
                                                          .currentPage]['subtitle']
                                                      as String,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 3,
                                                    color:
                                                        hoverProvider
                                                            .isHoveringCommunity
                                                        ? Colors.black
                                                        : Colors.white
                                                              .withOpacity(
                                                                0.85,
                                                              ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ).animate().fadeIn(delay: 1.2.seconds, duration: 1.seconds),
                                      ),
                                    ],
                                  ),
                          ),

                          const SizedBox(height: 40),

                          // BUTTON UNDER CAROUSEL
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: md.screenHeight * 0.1),

                  GlassContainer(
                    key: scrollPro.contactKey,
                    width: md.isMobile
                        ? md.screenWidth * 0.95
                        : md.isTablet
                        ? md.screenWidth * 0.9
                        : md.screenWidth * 0.92,

                    height: null, // 🔥 critical

                    padding: EdgeInsets.zero,
                    child: const X9Footer(),
                  ),

                  // -------------------------------------
                ],
              ),
            ),
          ),

          // 🔥 FIXED NAVBAR ABOVE EVERYTHING
        ],
      ),
    );
  }

  Widget _audienceText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Audience / Customer Profile:",
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 18),

        Text(
          "Our audience consists of busy, successful people who value time "
          "and convenience more than money.",
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Colors.white.withOpacity(0.85),
          ),
        ),
        const SizedBox(height: 16),

        const Bullet(
          "Entrepreneurs, CXOs, investors, HNIs, and affluent families",
        ),
        const Bullet(
          "People who prefer seamless solutions rather than spending hours planning",
        ),
        const Bullet("People who appreciate luxury, privacy, and efficiency"),
      ],
    );
  }
}
