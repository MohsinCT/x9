import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:x9_concierge/constants/mediaquery.dart';
import 'package:x9_concierge/controller/card_expant_provider.dart';
import 'package:x9_concierge/controller/drop_down_provider.dart';
import 'package:x9_concierge/controller/hover_provider.dart';
import 'package:x9_concierge/controller/membership_provider.dart';
import 'package:x9_concierge/controller/nav_hover_provider.dart';
import 'package:x9_concierge/controller/x9_landing_controller.dart';
import 'package:x9_concierge/firebase_options.dart';
import 'package:x9_concierge/screens/another_home_page.dart';
import 'package:x9_concierge/screens/mobile/web_or_mob.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => X9LandingProvider()),
        ChangeNotifierProvider(create: (_) => MembershipProvider()),
        ChangeNotifierProvider(create: (_) => HoverProvider()),
        ChangeNotifierProvider(create: (_) => CardExpandProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => HoverNavProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);
    return MaterialApp(
      title: 'x9concierge',
      debugShowCheckedModeBanner: false,
      home: md.isMobile ? WebOrMob() : AnotherHm(),
    );
  }
}
