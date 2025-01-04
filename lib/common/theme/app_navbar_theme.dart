import 'package:flutter/material.dart';

class AppNavbarTheme {
  static final appNavbarTheme = NavigationBarThemeData(
      indicatorColor: Colors.purple[200],
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            );
          }
          return const TextStyle(color: Colors.black);
        },
      ),
    );
}