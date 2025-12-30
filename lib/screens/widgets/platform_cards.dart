import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:x9_concierge/constants/mediaquery.dart';
import 'package:x9_concierge/controller/hover_provider.dart';
import 'package:x9_concierge/controller/membership_provider.dart';

import 'package:x9_concierge/screens/mobile/card_details_mob.dart';
import 'package:x9_concierge/screens/mobile/membership_mobile.dart';

class X9MembershipCardMobile extends StatelessWidget {
  const X9MembershipCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);
    final x9Provider = Provider.of<MembershipProvider>(context);
    final hoverProvider = Provider.of<HoverProvider>(context);

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Membership Tiers",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),

        SizedBox(
          height: md.screenHeight * 0.42,
          child: CarouselSlider.builder(
            itemCount: cards.length,
            itemBuilder: (context, index, _) {
              final card = cards[index];
              return X9MembershipCardMOB(
                index: index,
                title: card['title'] as String,
                subtitle: card['subtitle'] as String,
                cardImage: card['cardImage'] as String,
                gradient: card['gradient'] as LinearGradient,
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                x9Provider.setIndex(index);
              },
            ),
          ),
        ),

        GestureDetector(
          onTapDown: (_) => HapticFeedback.lightImpact(),
          onTap: () {
            final currentCard = cards[x9Provider.currentPage];

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => CardDetailsMob(
                  cardImage: currentCard['cardImage']as String,
                  title: currentCard['title'] as String,
                  core: currentCard['core'] as List<String>,
                ),
              ),
            );

            HapticFeedback.mediumImpact();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
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
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3,
                    color: hoverProvider.isHoveringCommunity
                        ? Colors.black
                        : Colors.white.withOpacity(0.85),
                  ),
                );
              },
            ),
          ),
        ).animate().fadeIn(delay: 1.2.seconds, duration: 1.seconds),
      ],
    );

  }
}
