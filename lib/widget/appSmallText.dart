import 'package:flutter/material.dart';

class AppSmallText extends StatelessWidget {
  final String text;
  final double? size;
  final String? family;
  final Color color;
  final FontWeight? weight;
  AppSmallText(
      {super.key,
      required this.text,
      this.color = Colors.white,
      this.size,
      this.family = 'Manrope',
      this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 10,
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: family,
      ),
    );
  }
}

class DefaultText extends StatelessWidget {
  final String text;
  final double? size;
  final Color color;
  DefaultText({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontFamily: "Manrope"),
    );
  }
}
