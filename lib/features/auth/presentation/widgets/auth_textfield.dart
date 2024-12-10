import 'package:flutter/material.dart';

class AuthTextfield extends StatelessWidget {
  final String hintText;
  const AuthTextfield({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
