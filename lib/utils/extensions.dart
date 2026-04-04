import 'package:flutter/material.dart';
import 'package:habitera/common/theme/text_theme.dart';
// import 'day_only.dart' as day_only;

extension ContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

  // TextTheme get newTextTheme => Theme.of(this).textTheme;
extension AppTextStyles on BuildContext {

  TextStyle get screenTitle => textTheme.titleLarge!;
  TextStyle get sectionTitle => textTheme.titleMedium!;
  TextStyle get formTitle => textTheme.labelLarge!;
  TextStyle get body => textTheme.bodyMedium!;
  TextStyle get small => textTheme.bodySmall!;
}
  // TextStyle get bodyBig => textTheme.bodyLarge!;
  // TextStyle get sectionTitle => newTextTheme.titleMedium!;
  // TextStyle get habitTitle => newTextTheme.bodyLarge!;
  // TextStyle get caption => newTextTheme.bodySmall!;
  // TextStyle get button => newTextTheme.labelLarge!;
// extension AppTextStyles on BuildContext {
//   TextTheme get newTextTheme => Theme.of(this).textTheme;

//   TextStyle get screenTitle => newTextTheme.titleLarge!;
//   TextStyle get sectionTitle => NewAppTextTheme.appTextTheme.titleMedium!;
//   TextStyle get habitTitle => NewAppTextTheme.appTextTheme.bodyLarge!;
//   TextStyle get body => NewAppTextTheme.appTextTheme.bodyMedium!;
//   TextStyle get caption => NewAppTextTheme.appTextTheme.bodySmall!;
//   TextStyle get button => NewAppTextTheme.appTextTheme.labelLarge!;
// }
// extension DateExtension on DateTime {
//   DateTime get dayOnly => day_only.dayOnly(this);
// }
