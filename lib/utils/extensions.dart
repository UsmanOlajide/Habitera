import 'package:flutter/material.dart';
import 'day_only.dart' as day_only;

extension ContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension DateExtension on DateTime {
  DateTime get dayOnly => day_only.dayOnly(this);
}