import 'package:demo_clean_architecture/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Size? fixedSize;
  final String? buttonText;
  const AuthButton({super.key, this.buttonText, this.fixedSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppPallete.gradient1, fixedSize: fixedSize),
        onPressed: () {},
        child: Text(
          buttonText ?? "",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ));
  }
}
