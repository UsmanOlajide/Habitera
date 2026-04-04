// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitera/constants/color_picker.dart';

// class AppTypography {
//   AppTypography._();

//   static final screenTitle = _base.copyWith(
//     fontSize: 19,
//     fontWeight: FontWeight.w700,
//   );

//   static final body = _base.copyWith(
//     fontSize: 14,
//     fontWeight: FontWeight.w400,
//   );
// }

//* Role	              Example in Habitera
//* screenTitle	        "Create Account", "Your Habits", "Edit Habit"
//* sectionTitle	      "Today", "Habit Details"
//* body	              descriptions, instructions
//* caption / small	    streak text, helper text
//* button	            "Sign Up", "Add Habit"
//* inputLabel	        "Email", "Password"
//* emptyState	        "No habits yet"

// final base = GoogleFonts.nunitoSans();

// class AppTextTheme {
//   AppTextTheme._();

//   static final appTextTheme = TextTheme(
//     // TITLES
//     titleLarge: base.copyWith(
//       fontWeight: FontWeight.w700,
//       // default values:
//       // FontWeight.w400
//       // fontSize: 30,
//     ),
//     titleMedium: base.copyWith(
//       fontWeight: FontWeight.w700,
//       // default values:
//       // FontWeight.w500
//       // fontsize: 16
//     ),
//     titleSmall: base.copyWith(
//       // fontWeight: FontWeight.w700,

//       // default values:
//       // FontWeight.w500
//       // fontsize: 14
//     ),
//     bodyLarge: base.copyWith(
//       fontWeight: FontWeight.w500,
//       // default values:
//       // FontWeight.w400
//       // fontsize: 16
//     ),
//     bodyMedium: base.copyWith(
//       fontWeight: FontWeight.w400,
//       // default values:
//       // FontWeight.w400
//       // fontSize: 14,
//     ),
//     bodySmall: base.copyWith(
//       fontWeight: FontWeight.w500,
//       // default values:
//       // FontWeight.w400
//       // fontSize: 12,
//     ),
//     labelMedium: base.copyWith(
//       fontWeight: FontWeight.w600,
//       // default values:
//       // FontWeight.w500
//       // fontSize: 12,
//     ),
//     labelLarge: base.copyWith(
//       fontWeight: FontWeight.w500,
//       // default values:
//       // FontWeight.w500
//       // fontsize: 14
//     ),
//     headlineSmall: base.copyWith(
//       fontWeight: FontWeight.w600,
//       // default values:
//       // FontWeight.w400
//       // fontsize: 24
//     ),
//   );
// }

class AppTextTheme {
  AppTextTheme._();

  static TextStyle nunitoSans({
    FontWeight? fontWeight,
    double? fontsize,
    Color? color,
  }) {
    return GoogleFonts.nunitoSans(
      fontWeight: fontWeight,
      fontSize: fontsize,
      color: color,
    );
  }

  static final appTextTheme = TextTheme(
    //* context.screenTitle - Titles
    titleLarge: nunitoSans(
      fontWeight: FontWeight.w700,
      // default values:
      // FontWeight.w400
      fontsize: 24,
    ),
    //* context.sectionTitle - Section Titles
    titleMedium: nunitoSans(
      fontWeight: FontWeight.w700,
      // default values:
      // FontWeight.w500
      fontsize: 15,
    ),
    //* context.body - Normal Text
    bodyMedium: nunitoSans(
      fontWeight: FontWeight.w400,
      // default values:
      // FontWeight.w400
      // fontSize: 14,
    ),
    //* context.small - Small Text
    bodySmall: nunitoSans(
      fontWeight: FontWeight.w500,
      // default values:
      // FontWeight.w400
      // fontSize: 12,
    ),
    //* context.formTitle - Form Titles
    labelLarge: nunitoSans(
      fontWeight: FontWeight.w700,
      // default values:
      // FontWeight.w500
      fontsize: 15,
    ),
    // labelMedium: nunitoSans(
    //   fontWeight: FontWeight.w600,
    //   // color: ColorPicker.red,
    //   // default values:
    //   // FontWeight.w500
    //   // fontsize: 12,
    // ),
    titleSmall: nunitoSans(
      // default values:
      // FontWeight.w500
      // fontsize: 14
    ),
    bodyLarge: nunitoSans(
      fontWeight: FontWeight.w500,
      // default values:
      // FontWeight.w400
      // fontsize: 16
    ),
    labelSmall: nunitoSans(
      fontWeight: FontWeight.w800,
      // default values:
      // FontWeight.w500
      // fontsize: 11,
    ),
  );
}
