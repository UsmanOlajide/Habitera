import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitera/constants/enums.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/router/app_router.dart';
import 'package:habitera/utils/extensions.dart';

class HabitTypeBottomSheet extends StatelessWidget {
  const HabitTypeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          kSizedBoxh10,
          Text('Add a Habit', style: context.textTheme.titleMedium),
          kSizedBoxh20,
          ElevatedButton(
            onPressed: () => context.pop(HabitType.startHabit),
            child: Text('Start a Habit'),
          ),
          Text('(e.g. Exercise, Read, Wake up early)'),
          kSizedBoxh15,
          ElevatedButton(
           onPressed: () => context.pop(HabitType.breakHabit),
            child: Text('Break a Habit'),
          ),
          Text('(e.g. Smoking, Sugar, Procrastination)'),
        ],
      ),
    );
  }
}

void goToAddHabit(BuildContext context, HabitType type) async {
  final added = await context.pushNamed<bool>(
    AppRoutes.addHabitsScreen.name,
    pathParameters: {'type': type.name},
  );

  if (context.mounted && added == true) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Habit added')));
  }
}

// class HabitTypeBottomSheet extends StatelessWidget {
//   const HabitTypeBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 250,
//       width: double.infinity,
//       child: Column(
//         children: [
//           kSizedBoxh10,
//           Text('Add a Habit', style: context.textTheme.titleMedium),
//           kSizedBoxh20,
//           ElevatedButton(
//             onPressed: () {
//               context.pop();
//               goToAddHabit(context, HabitType.startHabit);
//             },
//             child: Text('Start a Habit'),
//           ),
//           Text('(e.g. Exercise, Read, Wake up early)'),
//           kSizedBoxh15,
//           ElevatedButton(
//             onPressed: () {
//               context.pop();
//               goToAddHabit(context, HabitType.breakHabit);
//             },
//             child: Text('Break a Habit'),
//           ),
//           Text('(e.g. Smoking, Sugar, Procrastination)'),
//         ],
//       ),
//     );
//   }
// }

// void goToAddHabit(BuildContext context, HabitType type) async {
//   final added = await context.pushNamed<bool>(
//     AppRoutes.addHabitsScreen.name,
//     pathParameters: {'type': type.name},
//   );

//   if (context.mounted && added == true) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text('Habit added')));
//   }
// }
