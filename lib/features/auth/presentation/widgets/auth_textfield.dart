import 'package:flutter/material.dart';

class AuthTextfield extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final TextEditingController controller;
  const AuthTextfield(
      {super.key,
      this.obscureText = false,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is empty";
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
