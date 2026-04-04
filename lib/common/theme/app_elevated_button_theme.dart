import 'package:flutter/material.dart';
import 'package:habitera/common/theme/text_theme.dart';
import 'package:habitera/constants/color_picker.dart';
import 'package:habitera/utils/extensions.dart';

class AppElevatedButtonTheme {
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      fixedSize: const Size(double.infinity, 40),
      shape: StadiumBorder(),
      textStyle: AppTextTheme.nunitoSans(
        fontWeight: FontWeight.w700,
        fontsize: 16,
      ),
    ),
  );
}
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(8.0),
      // ),
      // textStyle: GoogleFonts.poppins(
      //   fontWeight: FontWeight.w600,
      //   fontSize: 16.0,
      // ),

