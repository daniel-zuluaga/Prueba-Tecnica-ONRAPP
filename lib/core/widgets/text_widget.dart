import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    required this.style,
    required this.color,
    required this.fontWeight,
    required this.textAlign,
  });
  final String text;
  final TextStyle style;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style.copyWith(
        color: color,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
    );
  }
}
