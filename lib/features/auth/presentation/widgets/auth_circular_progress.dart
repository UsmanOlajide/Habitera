import 'package:flutter/material.dart';
import 'package:habitera/constants/color_picker.dart';

class AuthCircularProgress extends StatelessWidget {
  const AuthCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(
          color: ColorPicker.white,
        ),
      );
  }
}
