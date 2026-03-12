import 'package:flutter/material.dart';
import 'package:habitera/constants/color_picker.dart';
import 'package:habitera/utils/extensions.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.obscureText,
    this.isExpandable,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool obscureText;
  final bool? isExpandable;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      decoration: const BoxDecoration(
        // color: Colors.red.shade200,
        // color: ColorPicker.black,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(229, 233, 237, 0.24),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        cursorColor: ColorPicker.black,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText,
        validator: widget.validator,
        minLines: 1,
        // style: context.textTheme.bodySmall?.copyWith(
        //   color: ColorPicker.textBlack,
        //   height: 0,
        // ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              widget.label,
              style: context.textTheme.bodySmall?.copyWith(
                color: ColorPicker.black,
              ),
            ),
          ),
          // prefixIconConstraints: const BoxConstraints(minWidth: 125),
          // hintText: widget.hintText,
          label: Text(
            widget.hintText,
            style: context.textTheme.bodySmall?.copyWith(
              color: ColorPicker.grey,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,

          // hintStyle: const TextStyle(
          //   fontSize: 14,
          //   color: Colors.grey,
          // ),
          // filled: true,
          // fillColor: Colors.white,
          // border: InputBorder.none,
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(5.0),
          //   borderSide: const BorderSide(color: ColorPicker.disabledColor),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(5.0),
          //   borderSide: const BorderSide(
          //     color: ColorPicker.secondary,
          //   ),
          // ),
          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(5.0),
          //   borderSide: const BorderSide(color: ColorPicker.error),
          // ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          suffixIcon: widget.obscureText
              ? InkWell(
                  onTap: _toggleObscureText,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 17.5),
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                )
              : null,
        ),
        // style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

//* Previous code
// import 'package:flutter/material.dart';

// class CustomTextFormField extends StatefulWidget {
//   final TextEditingController controller;
//   final String label;
//   final String hintText;
//   final bool obscureText;
//   final bool? isExpandable;
//   final TextInputType? keyboardType;
//   final String? Function(String?)? validator;

//   const CustomTextFormField({
//     super.key,
//     required this.controller,
//     required this.label,
//     required this.hintText,
//     required this.obscureText,
//     this.isExpandable,
//     this.keyboardType,
//     this.validator,
//   });

//   @override
//   _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
// }

// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   late bool _obscureText;

//   @override
//   void initState() {
//     super.initState();
//     _obscureText = widget.obscureText;
//   }

//   void _toggleObscureText() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 5,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: TextFormField(
//           cursorColor: Colors.black,
//           controller: widget.controller,
//           keyboardType: widget.keyboardType,
//           obscureText: _obscureText,
//           validator: widget.validator,
//           minLines: 1,
//           maxLines: widget.isExpandable == true ? 5 : 1,
//           decoration: InputDecoration(
//             prefixIcon: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Text(
//                 widget.label,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             prefixIconConstraints: const BoxConstraints(minWidth: 130),
//             hintText: widget.hintText,
//             hintStyle: const TextStyle(
//               fontSize: 14,
//               color: Colors.grey,
//             ),
//             filled: true,
//             fillColor: Colors.white,
//             border: InputBorder.none,
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(
//                 color: Theme.of(context).colorScheme.secondary,
//                 width: 2,
//               ),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: const BorderSide(color: Colors.red),
//             ),
//             contentPadding:
//                 const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
//             suffixIcon: widget.obscureText
//                 ? IconButton(
//                     icon: Icon(
//                       _obscureText ? Icons.visibility_off : Icons.visibility,
//                     ),
//                     onPressed: _toggleObscureText,
//                   )
//                 : null,
//           ),
//           style: const TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
// }
