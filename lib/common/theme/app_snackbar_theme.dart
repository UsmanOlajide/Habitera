import 'package:flutter/material.dart';
import 'package:habitera/common/theme/text_theme.dart';
import 'package:habitera/constants/color_picker.dart';

class AppSnackbarTheme {
  AppSnackbarTheme._();

  static final appSnackbarTheme = SnackBarThemeData(
    contentTextStyle: AppTextTheme.nunitoSans(
      color: ColorPicker.white,
      fontWeight: FontWeight.w700
    ),
  );
}
