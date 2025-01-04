import 'package:flutter/material.dart';
import 'package:habitera/common/theme/app_theme_data.dart';
import 'package:habitera/navigation/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habitera',
      theme: AppThemeData.lightTheme,
      home: const NavBar(),
    );
  }
}
