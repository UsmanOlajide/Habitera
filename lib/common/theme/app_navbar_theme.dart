import 'package:flutter/material.dart';

    // indicatorColor: Colors.indigoAccent,
    // indicatorShape: const CircleBorder(),
class AppNavbarTheme {
  static final appNavbarTheme = NavigationBarThemeData(
    labelTextStyle: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          );
        }
        return const TextStyle(color: Colors.black);
      },
    ),
  );
}
