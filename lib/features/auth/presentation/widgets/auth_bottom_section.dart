import 'package:flutter/material.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/utils/extensions.dart';

class AuthBottomSection extends StatelessWidget {
  const AuthBottomSection({
    super.key,
    required this.leftText,
    required this.rightText, this.onPressed,
  });

  final String leftText;
  final String rightText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leftText,
          style: context.body.copyWith(
            fontSize: labelFontSize,
            color: const Color.fromARGB(255, 115, 114, 114),
          ),
        ),
        kSizedBoxW4,
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            rightText,
            style: context.body.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: labelFontSize,
            ),
          ),
        ),
      ],
    );
  }
}
