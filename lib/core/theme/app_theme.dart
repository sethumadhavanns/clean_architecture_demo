import 'package:demo_clean_architecture/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) =>
      const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            width: 3,
          ));
  static final darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppPallete.backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: _border(),
          focusedBorder: _border(AppPallete.gradient2),
          disabledBorder: _border()));
}
