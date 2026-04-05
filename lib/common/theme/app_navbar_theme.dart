import 'package:flutter/material.dart';
import 'package:habitera/common/theme/text_theme.dart';
import 'package:habitera/constants/color_picker.dart';

// indicatorColor: Colors.indigoAccent,
// indicatorShape: const CircleBorder(),
class AppNavbarTheme {
  static final appNavbarTheme = NavigationBarThemeData(
    backgroundColor: ColorPicker.scaffoldBg,
    height: 50,
    indicatorColor: Colors.transparent,
    overlayColor: WidgetStateProperty.resolveWith( (states) => Colors.transparent),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return IconThemeData(color: ColorPicker.black);
      }
      return IconThemeData(color: ColorPicker.navBarIcon);
    }),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppTextTheme.nunitoSans(
          fontWeight: FontWeight.w700,
          fontsize: 14,
          color: ColorPicker.black,
        );
      }
      return AppTextTheme.nunitoSans(
        fontsize: 14,
        color: ColorPicker.navBarIcon,
      );
    }),
    labelPadding: EdgeInsets.only(bottom: 4),
  );
}
