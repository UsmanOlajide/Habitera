import 'package:flutter/material.dart';
import 'package:habitera/common/theme/text_theme.dart';
import 'package:habitera/constants/color_picker.dart';

class AppAppbarTheme {
  static final appAppBarTheme = AppBarTheme(
    backgroundColor: ColorPicker.white,
    titleTextStyle: AppTextTheme.nunitoSans(
      fontWeight: FontWeight.w700,
      fontsize: 24,
      color: ColorPicker.black
    ),
    // foregroundColor: ColorPicker.black,
    // titleTextStyle: AppTextTheme.nunitoSans(
    //   fontWeight: FontWeight.w700,
    //   fontsize: 24,
    // ),
  );
}
