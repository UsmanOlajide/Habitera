import 'package:flutter/material.dart';
import 'package:habitera/constants/color_picker.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/utils/extensions.dart';

class SigninField extends StatelessWidget {
  const SigninField({
    super.key,
    required this.title,
    this.controller,
    this.onChanged,
    required this.obscureText,
    this.keyboardType,
    this.validator,
    required this.labelText,
    this.suffixIcon,
  });

  final String title;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String labelText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final signInFieldLabelStyle = context.body.copyWith(fontSize: 16);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.formTitle),
        kSizedBoxH8,
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType ?? TextInputType.name,
          validator: validator,
          decoration: InputDecoration(
            label: Text(labelText, style: signInFieldLabelStyle),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

// class OldSigninField extends StatelessWidget {
//   const OldSigninField({
//     super.key,
//     this.prefixIcon,
//     this.label,
//     this.isDense,
//     this.validator,
//     this.onChanged,
//     this.focusedBorder,
//     this.enabledBorder,
//     this.controller,
//     this.suffixIcon,
//     this.obscureText = false,
//     this.keyboardType,
//   });

//   final String? Function(String?)? validator;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final Widget? label;
//   final bool? isDense;
//   final bool obscureText;
//   final Function(String)? onChanged;
//   final InputBorder? focusedBorder;
//   final InputBorder? enabledBorder;
//   final TextEditingController? controller;
//   final TextInputType? keyboardType;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 48.0,
//       decoration: const BoxDecoration(
//         color: ColorPicker.red,
//         // boxShadow: [
//         //   BoxShadow(
//         //     color: Color.fromRGBO(229, 233, 237, 0.24),
//         //     blurRadius: 5,
//         //     offset: Offset(0, 2),
//         //   ),
//         // ],
//       ),
//       child: TextFormField(
//         // cursorColor: ColorPicker.black,
//         // cursorHeight: 15.0,
//         controller: controller,
//         onChanged: onChanged,
//         obscureText: obscureText,
//         keyboardType: keyboardType ?? TextInputType.name,
//         validator: validator,
//         // style: context.textTheme.bodySmall?.copyWith(
//         //   color: ColorPicker.black,
//         //   height: 0,
//         // ),
//         decoration: InputDecoration(
//           isDense: isDense ?? true,
//           border: InputBorder.none,
//           // prefixIconConstraints: const BoxConstraints(minWidth: 125),
//           prefixIcon: prefixIcon,
//           suffixIcon: suffixIcon,
//           // suffixIconConstraints: const BoxConstraints(minWidth: 0),
//           label: label,
//           // contentPadding: const EdgeInsets.symmetric(
//           //   horizontal: 15.0,
//           //   vertical: 15.0,
//           // ),
//           focusedBorder:
//               focusedBorder ??
//               OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5.0),
//                 borderSide: BorderSide(
//                   color: Theme.of(context).colorScheme.secondary,
//                 ),
//               ),
//           enabledBorder:
//               enabledBorder ??
//               OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5.0),
//                 borderSide: const BorderSide(
//                   color: ColorPicker.grey,
//                   width: 0.5,
//                 ),
//               ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: const BorderSide(color: ColorPicker.red),
//           ),
//           floatingLabelBehavior: FloatingLabelBehavior.never,
//         ),
//       ),
//     );
//   }
// }
