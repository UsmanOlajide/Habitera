import 'package:flutter/material.dart';

class AppElevatedButtonTheme {
  static final elevatedButtonTheme = ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      fixedSize: const Size(double.infinity, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      // textStyle: GoogleFonts.poppins(
      //   fontWeight: FontWeight.w600,
      //   fontSize: 16.0,
      // ),
    ),
  );
}
