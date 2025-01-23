import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.isPassword,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        textInputAction: textInputAction ?? TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(
          color: Colors.grey.shade900,
        ),
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
