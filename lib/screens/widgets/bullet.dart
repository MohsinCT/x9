import 'package:flutter/material.dart';

class Bullet extends StatelessWidget {
  final String text;
  const Bullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        "• $text",
        style: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Colors.white.withOpacity(0.85),
        ),
      ),
    );
  }
}
