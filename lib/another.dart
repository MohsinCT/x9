// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:lucide_icons_flutter/lucide_icons.dart';
// import 'package:provider/provider.dart';
// import 'package:x9_concierge/controller/x9_landing_controller.dart';


// class X9LandingPage extends StatelessWidget {
//   const X9LandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<X9LandingProvider>(context);
//     final media = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           _buildBackground(),
          
//         ],
//       ),
//     );
//   }

//   Widget _buildBackground() {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFF0B0C10),
//                 Color(0xFF1A1A2E),
//                 Color(0xFF2D1B4E),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         Positioned.fill(
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: RadialGradient(
//                 center: Alignment.topCenter,
//                 radius: 1.2,
//                 colors: [Colors.white.withOpacity(0.06), Colors.transparent],
//               ),
//             ),
//           ),
//         ),
//         Positioned.fill(
//           child: AnimatedContainer(
//             duration: const Duration(seconds: 10),
//             curve: Curves.easeInOut,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFF0B0C10),
//                   Color(0xFF1F1C2C),
//                   Color(0xFF2D1B4E),
//                   Color(0xFF0B0C10),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//           )
//               .animate(
//                 onPlay: (controller) => controller.repeat(reverse: true),
//               )
//               .shimmer(delay: 0.5.seconds, duration: 8.seconds),
//         ),
//       ],
//     );
//   }

//   Widget _buildForeground(
//       BuildContext context, X9LandingProvider provider, Size media) {
//     return Stack(
      
//       children: [
//         _buildNavbar(),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildCards(media, provider),
//             const SizedBox(height: 80),
//             _buildCommunityButton(context, provider),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildNavbar() {
//     return Positioned(
//       top: 0,
//       left: 0,
//       right: 0,
//       child: ClipRRect(
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.05),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.4),
//                   blurRadius: 25,
//                   offset: const Offset(0, 8),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 38,
//                       height: 38,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         gradient: LinearGradient(
//                           colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     const Text(
//                       "X9",
//                       style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.w600,
//                         fontSize: 28,
//                         color: Colors.white,
//                         letterSpacing: 2,
//                       ),
//                     ),
//                   ],
//                 ),
//                 IconButton(
//                   icon: const Icon(LucideIcons.menu,
//                       color: Colors.white, size: 28),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCards(Size media, X9LandingProvider provider) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           _buildCard('gold', provider,
//               title: 'GOLD',
//               subtitle: 'Elite Member Access',
//               gradient: const LinearGradient(
//                 colors: [Color(0xFFFFE082), Color(0xFFFFD54F), Color(0xFFFFB300)],
//               )).animate().fadeIn(duration: 1800.ms).moveX(begin: -100, end: 0),
//           SizedBox(width: media.width * 0.04),
//           _buildCard('platinum', provider,
//               title: 'PLATINUM',
//               subtitle: 'Global Tier Access',
//               gradient: const LinearGradient(
//                 colors: [Color(0xFFE0E0E0), Color(0xFFB0BEC5), Color(0xFFCFD8DC)],
//               )).animate().fadeIn(duration: 1800.ms).moveY(begin: -100, end: 0),
//           SizedBox(width: media.width * 0.04),
//           _buildCard('black', provider,
//               title: 'BLACK',
//               subtitle: 'Signature Membership',
//               gradient: const LinearGradient(
//                 colors: [Color(0xFF000000), Color(0xFF1A1A1A), Color(0xFF434343)],
//               )).animate().fadeIn(duration: 1800.ms).moveX(begin: 100, end: 0),
//         ],
//       ),
//     );
//   }

//   Widget _buildCard(String key, X9LandingProvider provider,
//       {required String title,
//       required String subtitle,
//       required Gradient gradient}) {
//     final isHovered = provider.isCardHovered(key);

//     return MouseRegion(
//       onEnter: (_) => provider.setCardHover(key, true),
//       onExit: (_) => provider.setCardHover(key, false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 400),
//         width: 420,
//         height: 250,
//         decoration: BoxDecoration(
//           gradient: gradient,
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.2),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.6),
//               blurRadius: 25,
//               offset: const Offset(0, 8),
//             ),
//             if (isHovered)
//               BoxShadow(
//                 color: Colors.white.withOpacity(0.15),
//                 blurRadius: 40,
//                 spreadRadius: 8,
//               ),
//           ],
//         ),
//         child: Stack(
//           children: [
//             _cardOverlay(),
//             _cardContent(title, subtitle),
//             if (isHovered) _hoverContent(),
//             _cardLogo(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _cardOverlay() => Positioned.fill(
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.white.withOpacity(0.08), Colors.transparent],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );

//   Widget _cardContent(String title, String subtitle) => Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(title,
//                 style: const TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     letterSpacing: 2)),
//             const SizedBox(height: 6),
//             Text(subtitle,
//                 style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 14,
//                     fontWeight: FontWeight.w400,
//                     color: Colors.white.withOpacity(0.85),
//                     letterSpacing: 1)),
//           ],
//         ),
//       );

//   Widget _hoverContent() => Center(
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.55),
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: const Text(
//             "• Exclusive Access\n• Concierge Services\n• Personalized Perks",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'Poppins',
//                 fontSize: 15,
//                 height: 1.6),
//           ),
//         ).animate().fadeIn(duration: 400.ms),
//       );

//   Widget _cardLogo() => Positioned(
//         left: 20,
//         bottom: 15,
//         child: Row(
//           children: [
//             Container(
//               width: 22,
//               height: 22,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
//                 ),
//               ),
//             ),
//             const SizedBox(width: 6),
//             const Text(
//               "X9",
//               style: TextStyle(
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16,
//                   color: Colors.white70),
//             ),
//           ],
//         ),
//       );

//   Widget _buildCommunityButton(BuildContext context, X9LandingProvider provider) {
//     final isHovering = provider.isHoveringCommunity;

//     return MouseRegion(
//       onEnter: (_) => provider.setCommunityHover(true),
//       onExit: (_) => provider.setCommunityHover(false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50),
//           gradient: isHovering
//               ? const LinearGradient(
//                   colors: [Color(0xFFFFD700), Color(0xFFFFF59D)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 )
//               : null,
//           border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
//           boxShadow: isHovering
//               ? [
//                   BoxShadow(
//                     color: Colors.yellowAccent.withOpacity(0.5),
//                     blurRadius: 25,
//                     spreadRadius: 2,
//                   ),
//                 ]
//               : [],
//         ),
//         child: Text(
//           "X9 COMMUNITY",
//           style: TextStyle(
//             fontFamily: 'Poppins',
//             fontSize: 22,
//             fontWeight: FontWeight.w600,
//             letterSpacing: 3,
//             color: isHovering ? Colors.black : Colors.white.withOpacity(0.85),
//           ),
//         ),
//       ),
//     ).animate().fadeIn(delay: 1.2.seconds, duration: 1.seconds);
//   }
// }
