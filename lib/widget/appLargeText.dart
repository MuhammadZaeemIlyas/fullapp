import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  AppLargeText(
      {super.key, required this.text, required this.color, this.size = 34});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
        fontSize: size,
      ),
    );
  }
}
