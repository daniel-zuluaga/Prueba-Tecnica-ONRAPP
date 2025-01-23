import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.onTap,
      required this.child,
      required this.style, required this.width, required this.height,});

  final VoidCallback onTap;
  final Widget child;
  final ButtonStyle style;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: style,
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
