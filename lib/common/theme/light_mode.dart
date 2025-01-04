import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade700,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade700,
    surfaceTintColor: Colors.grey.shade700,
  ),
);
