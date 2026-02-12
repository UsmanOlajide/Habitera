
import 'package:flutter/material.dart';
import 'package:habitera/utils/extensions.dart';

class TypeChip extends StatelessWidget {
  const TypeChip({super.key, required this.type});

  final int type;

  @override
  Widget build(BuildContext context) {
    final isHabitType = type == 0;
    final label = isHabitType ? 'START' : 'BREAK';

    // final bg = isHabitType ?
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: context.textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}