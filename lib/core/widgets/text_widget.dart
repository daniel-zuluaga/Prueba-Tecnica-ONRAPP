import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    required this.style,
    required this.color,
    required this.fontWeight,
    required this.textAlign,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
  });
  final String text;
  final TextStyle style;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style.copyWith(
        color: color,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
    );
  }
}
