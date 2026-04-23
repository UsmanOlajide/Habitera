import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<TimeOfDay?> pickTime(
  BuildContext context,
  TimeOfDay selectedTime,
) async {
  if (Platform.isIOS) {
    TimeOfDay? result;

    await showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return Container(
          height: 250,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: DateTime(
              2026,
              1,
              1,
              selectedTime.hour,
              selectedTime.minute,
            ),
            onDateTimeChanged: (newTime) {
              result = TimeOfDay(hour: newTime.hour, minute: newTime.minute);
            },
          ),
        );
      },
    );

    return result;
  } else {
    return await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
  }
}
