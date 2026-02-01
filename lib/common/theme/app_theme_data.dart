import 'package:flutter/material.dart';
import 'package:habitera/common/theme/app_elevated_button_theme.dart';
import 'package:habitera/common/theme/app_input_decoration_theme.dart';
import 'package:habitera/common/theme/app_navbar_theme.dart';
import 'package:habitera/common/theme/text_theme.dart';
// import 'package:habitera/common/theme/dark_mode.dart';
// import 'package:habitera/common/theme/light_mode.dart';

class AppThemeData {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    navigationBarTheme: AppNavbarTheme.appNavbarTheme,
    textTheme: AppTextTheme.appTextTheme,
    inputDecorationTheme: AppInputDecorationTheme.appInputDecorationTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonTheme,
  );
}








































//*  Using provider to switch between the light mode and dark mode (MITCH KOKO's video)
// class ThemeProvider extends ChangeNotifier {
//   ThemeData _themeData = lightMode;

//   ThemeData get themeData => _themeData;

//   bool get isDarkMode => _themeData == darkMode;

//   set themeData(ThemeData themeData) {
//     _themeData = themeData;
//     notifyListeners();
//   }

//   //toggle method to switch between the two
//   void toogleTheme() {
//     if (_themeData == lightMode) {
//       _themeData = darkMode;
//     } else {
//       _themeData = lightMode;
//     }
//     notifyListeners();
//   }
// }
