import 'package:flutter/material.dart';
import 'package:x9_concierge/constants/mediaquery.dart';

class X9Footer extends StatelessWidget {
  const X9Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final md = MediaQueryHelper(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: md.isMobile ? 32 : 40,
        horizontal: md.isMobile ? 20 : 60,
      ),
      color: Colors.black.withOpacity(0.25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          md.isMobile ? _mobileFooter() : _desktopFooter(),

          const SizedBox(height: 32),
          Divider(color: Colors.white.withOpacity(0.2), thickness: 1),
          const SizedBox(height: 20),

          Center(
            child: Text(
              "© 2025 X9 Concierge. All Rights Reserved.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= DESKTOP =================

  Widget _desktopFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _brandSection()),
        Expanded(child: _quickLinks()),
        Expanded(child: _services()),
        Expanded(child: _contact()),
      ],
    );
  }

  // ================= MOBILE =================

  Widget _mobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _brandSection(),
        const SizedBox(height: 32),
        _quickLinks(),
        const SizedBox(height: 32),
        _services(),
        const SizedBox(height: 32),
        _contact(),
      ],
    );
  }

  // ================= SECTIONS =================

  Widget _brandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/x9_logo_trans.png",
          width: 150,
        ),
        const SizedBox(height: 16),
        Text(
          "X9 Concierge is a premium lifestyle management service designed for people who value time, privacy, and seamless luxury.",
          style: TextStyle(
            color: Colors.white.withOpacity(0.75),
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _quickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        footerHeader("Quick Links"),
        footerLink("Home"),
        footerLink("About Us"),
        footerLink("Membership"),
        footerLink("Contact"),
      ],
    );
  }

  Widget _services() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        footerHeader("Services"),
        footerLink("Virtual E A"),
        footerLink("Concierge Services"),
        footerLink("Family Support & Well being  "),
        footerLink("Exclusive"),
       
      ],
    );
  }

  Widget _contact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        footerHeader("Contact"),
        footerLink("x9community25@gmail.com"),
        footerLink("+91 98765 43210"),
        const SizedBox(height: 8),
        Text(
          "Bangalore, India",
          style: TextStyle(
            color: Colors.white.withOpacity(0.75),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // ================= TEXT STYLES =================

  Widget footerHeader(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget footerLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withOpacity(0.75),
          fontSize: 14,
        ),
      ),
    );
  }
}
