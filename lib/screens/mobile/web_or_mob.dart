
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:x9_concierge/constants/mediaquery.dart';
import 'package:x9_concierge/controller/hover_provider.dart';
import 'package:x9_concierge/controller/membership_provider.dart';
import 'package:x9_concierge/screens/mobile/card_details_mob.dart';
import 'package:x9_concierge/screens/mobile/membership_mobile.dart';

class WebOrMob extends StatelessWidget {
  const WebOrMob({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);
    final x9Proivder = Provider.of<MembershipProvider>(context, listen: false);
    final hoverProvider = Provider.of<HoverProvider>(context);

    final cards = [
      {
        'title': 'Gold Card',
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
        'title': ' Platinum Card (PVC)',
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
        'title': 'Pearl Membership Card',
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
        'title': 'Black Membership Metal Card(Premium)',
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
      '- Priority Concierge: Fastest response and white-glove service'
    ],
      },
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0, // removes shadow
        backgroundColor: Colors.transparent, // matches transparent container
        centerTitle: false,
        titleSpacing: 40,
        leadingWidth: 130,
        title: Row(
          children: [
            SizedBox(
              width: 38,
              height: 38,
              child: Image.asset('assets/Logo_Logomark_silver.png'),
            ),
            SizedBox(width: md.screenWidth * 0.01),
            Text(
              "X9 Concierge",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: md.screenWidth * 0.03,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.menu, color: Colors.white, size: 28),
            onPressed: () {},
          ),
          SizedBox(
            width: md.screenWidth * 0.1,
          ), // same right padding as original
        ],
      ),
      body: Stack(
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

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                itemCount: cards.length,
                itemBuilder: (context, index, realIndex) {
                  final card = cards[index];
                  return X9MembershipCardMOB(
                    cardImage: card['cardImage'] as String,
                    index: index,
                    title: card['title'] as String,
                    subtitle: card['subtitle'] as String,
                    gradient: card['gradient'] as dynamic,
                  );
                },
                options: CarouselOptions(
                  height: md.screenHeight * 0.2,

                  viewportFraction: 0.9, // keeps containers close together
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.5,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    x9Proivder.setIndex(index);
                  },
                ),
              ),
              SizedBox(height: md.screenHeight * 0.03),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                    left: 10,
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white54,
                      size: 28,
                    ),
                  ),

                  Text(
                    'Swipe cards',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: md.screenWidth * 0.02,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white54,
                      size: 28,
                    ),
                  ),
                ],
              ),
              SizedBox(height: md.screenHeight * 0.03),

              GestureDetector(
                onTapDown: (_) {
                  HapticFeedback.lightImpact(); // subtle tap — like Apple button feel
                },
                onTap: () {

                  final currentCard = cards[x9Proivder.currentPage];
                  // optional: another haptic or your action
                  HapticFeedback.mediumImpact();
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CardDetailsMob(
                    title: currentCard['title'] as String,
                    cardImage: currentCard['cardImage'] as String,
                     core: currentCard['core'] as List<String>,))); // slightly stronger
                  // your button logic here
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: hoverProvider.isHoveringCommunity
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
                    boxShadow: hoverProvider.isHoveringCommunity
                        ? [
                            BoxShadow(
                              color: Colors.yellowAccent.withOpacity(0.5),
                              blurRadius: 25,
                              spreadRadius: 2,
                            ),
                          ]
                        : [],
                  ),
                  child: Consumer<MembershipProvider>(
                    builder: (context, x9Pro, child) {
                      return Text(
                        cards[x9Pro.currentPage]['subtitle'] as String,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: md.screenWidth * 0.03,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3,
                          color: hoverProvider.isHoveringCommunity
                              ? Colors.black
                              : Colors.white.withOpacity(0.85),
                        ),
                      );
                    },
                  ),
                ).animate().fadeIn(delay: 1.2.seconds, duration: 1.seconds),
              ),

              SizedBox(height: md.screenHeight * 0.04),

              Text(
                'X9 Community',
                style: TextStyle(color: Colors.black.withOpacity(0.2)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
