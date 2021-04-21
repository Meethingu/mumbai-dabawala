import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  AppText(this.text, this.family, this.size, this.isBold, this.color);

  final String text;
  final String family;
  final double size;
  final bool isBold;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: family,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}
