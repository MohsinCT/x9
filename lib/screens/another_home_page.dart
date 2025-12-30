import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import 'package:x9_concierge/constants/mediaquery.dart';
import 'package:x9_concierge/controller/hover_provider.dart';
import 'package:x9_concierge/controller/membership_provider.dart';
import 'package:x9_concierge/screens/card_details.dart';
import 'package:x9_concierge/screens/widgets/background.dart';
import 'package:x9_concierge/screens/widgets/custom_navbar.dart';
import 'package:x9_concierge/screens/widgets/x9membershipcard.dart';

class AnotherHm extends StatelessWidget {
  const AnotherHm({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);
    final x9Proivder = Provider.of<MembershipProvider>(context, listen: false);
    final hoverProvider = Provider.of<HoverProvider>(context);

    // final isHoveringCommunity = hoverProvider.isHoveringCommunity;

    final List<Map<String, dynamic>> items = [
      {'title': 'Design', 'color': Colors.blueAccent},
      {'title': 'Development', 'color': Colors.deepPurple},
      {'title': 'Marketing', 'color': Colors.orange},
      {'title': 'Finance', 'color': Colors.green},
      {'title': 'AI & ML', 'color': Colors.redAccent},
    ];
    final cards = [
      {
        'title': 'GOLD',
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
        'title': 'PLATINUM',
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
        'title': 'Pearl',
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
        'title': 'BLACK',
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
      body: Stack(
        children: [
          // bg animated image
          BackgroundLayer(),

          // navbar
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomNavBar(),
                  Positioned.fill(
                    child: ClipRRect(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.25),
                          BlendMode.darken,
                        ),
                        child: Image.asset(
                          "assets/Brand_Guide_X9_comp.pdf.jpg", // your asset image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // section 1
                  const SizedBox(height: 300),

                  // section 2
                  CarouselSlider.builder(
                    itemCount: cards.length,
                    itemBuilder: (context, index, realIndex) {
                      final card = cards[index];
                      return X9MembershipCard(
                        cardImage: card['cardImage'] as String,
                        index: index,
                        title: card['title'] as String,
                        subtitle: card['subtitle'] as String,
                        gradient: card['gradient'] as dynamic,
                      );
                    },
                    options: CarouselOptions(
                      height: md.screenHeight * 0.37,
                      viewportFraction: 0.36, // keeps containers close together
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.57,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        x9Proivder.setIndex(index);
                      },
                    ),
                  ),

                  MouseRegion(
                    onEnter: (_) => hoverProvider.setHoveringCommunity(true),
                    onExit: (_) => hoverProvider.setHoveringCommunity(false),
                    child: GestureDetector(
                      onTapDown: (_) {
                        HapticFeedback.lightImpact(); // subtle tap — like Apple button feel
                      },
                      onTap: () {
                        final currentCard = cards[x9Proivder.currentPage];

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CardDetails(
                              title: currentCard['title']
                                  as String,
                              cardImage: currentCard['cardImage'] as String,
                              core: currentCard['core'] as dynamic,
                            ),
                          ),
                        );
                        // optional: another haptic or your action
                        HapticFeedback.mediumImpact(); // slightly stronger
                        // your button logic here
                      },
                      child:
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: hoverProvider.isHoveringCommunity
                                  ? const LinearGradient(
                                      colors: [
                                        Color(0xFFFFD700),
                                        Color(0xFFFFF59D),
                                      ],
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
                                        color: Colors.yellowAccent.withOpacity(
                                          0.5,
                                        ),
                                        blurRadius: 25,
                                        spreadRadius: 2,
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Consumer<MembershipProvider>(
                              builder: (context, x9Pro, child) {
                                return Text(
                                  cards[x9Pro.currentPage]['subtitle']
                                      as String,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 3,
                                    color: hoverProvider.isHoveringCommunity
                                        ? Colors.black
                                        : Colors.white.withOpacity(0.85),
                                  ),
                                );
                              },
                            ),
                          ).animate().fadeIn(
                            delay: 1.2.seconds,
                            duration: 1.seconds,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 50)],
          ),
        ],
      ),
    );
  }
}
