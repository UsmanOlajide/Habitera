import 'package:flutter/material.dart';
import 'package:habitera/constants/color_picker.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;
  final Color activeColor;
  final Color inactiveColor;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.width = 41.0,
    this.height = 21.0,
    this.activeColor = Colors.green,
    this.inactiveColor = ColorPicker.grey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          color: value ? activeColor : inactiveColor,
        ),
        child: Align(
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 17,
            height: 17,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

// //OLD SWITCH
// //  SizedBox(
// //                             // color: Colors.yellow.shade300,
// //                             width: 45.0,
// //                             height: 21.0,
// //                             child: Transform.scale(
// //                               scale: 0.7,
// //                               child: Switch(
// //                                 padding: const EdgeInsets.only(bottom: 0),
// //                                 value: _isToggled,
// //                                 onChanged: (value) {
// //                                   setState(() {
// //                                     _isToggled = value;
// //                                   });
// //                                 },
// //                                 activeColor: ColorPicker.primary,
// //                                 inactiveThumbColor: ColorPicker.primary,
// //                                 activeTrackColor: ColorPicker.switchColor,
// //                                 inactiveTrackColor: ColorPicker.offSwitch,
// //                               ),
// //                             ),
// //                           ),