import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  AppTextTheme._();

  static final TextTheme appTextTheme = TextTheme(
    headlineSmall: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w600,
      // default values:
      // FontWeight.w400
      // fontsize: 24
    ),
    titleSmall: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w400,
      // default values:
      // FontWeight.w500
      // fontsize: 14
    ),
    titleMedium: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w900,
      // default values:
      // FontWeight.w500
      // fontsize: 16
    ),
    titleLarge: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w700,
      // default values:
      // FontWeight.w400
      // fontSize: 22,
    ),
    labelMedium: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w600,
      // default values:
      // FontWeight.w500
      // fontSize: 12,
    ),
    bodySmall: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w500,
      // default values:
      // FontWeight.w400
      // fontSize: 12,
    ),
    bodyMedium: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w400,
      // default values:
      // FontWeight.w400
      // fontSize: 14,
    ),
    bodyLarge: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w500,
      // default values:
      // FontWeight.w400
      // fontsize: 16
    ),
    labelLarge: GoogleFonts.nunitoSans(
      fontWeight: FontWeight.w500,
      // default values:
      // FontWeight.w500
      // fontsize: 14
    ),
  );
}
