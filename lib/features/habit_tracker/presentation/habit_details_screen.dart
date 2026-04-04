import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/features/habit_tracker/data/models/habit.dart';
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:habitera/features/habit_tracker/presentation/habit_provider.dart';
import 'package:habitera/features/habit_tracker/presentation/widgets/last_seven_days_date_section.dart';
import 'package:habitera/features/habit_tracker/presentation/widgets/type_chip.dart';
import 'package:habitera/utils/created_date.dart';
import 'package:habitera/utils/date_utils.dart';
import 'package:habitera/utils/extensions.dart';

class HabitDetailsScreen extends ConsumerStatefulWidget {
  const HabitDetailsScreen({super.key, required this.habit});

  final Habit habit;

  @override
  ConsumerState<HabitDetailsScreen> createState() => _HabitDetailsScreenState();
}

class _HabitDetailsScreenState extends ConsumerState<HabitDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final checkinDayKeysForHabitAsync = ref.watch(
      checkinDayKeysForHabitProvider(widget.habit.id),
    );
    final checkinDayKeysForHabit = checkinDayKeysForHabitAsync.value ?? <int>{};

    final streak = calculateStreak(checkinDayKeysForHabit);

    final doneHabitIdsAsync = ref.watch(doneHabitIdsProvider);
    final isDone =
        doneHabitIdsAsync.valueOrNull?.contains(widget.habit.id) ?? false;

    final today = dayKey(DateTime.now());
    final optimizedCheckinDayKeys = isDone
        ? {...checkinDayKeysForHabit, today}
        : checkinDayKeysForHabit.where((dayKey) => dayKey != today).toSet();

    return Scaffold(
      appBar: AppBar(title: Text(widget.habit.title)),
      body: Padding(
        padding: padAll16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              //todo: Make the fire logo animate for a few seconds when user opens the details screen
              child: Text(
                '🔥 $streak day streak',
                style: context.sectionTitle,
                textAlign: TextAlign.center,
              ),
            ),
            kSizedBoxH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                TypeChip(type: widget.habit.type),
                Text(
                  'Daily • ${createdDate(widget.habit.createdAt)}',
                  style: context.small.copyWith(
                    // color: Colors.black38,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            kSizedBoxH10,
            // Row(
            //   children: [
            //     Checkbox(
            //       value: isDone,
            //       activeColor: Colors.green,
            //       onChanged: (value) async {
            //         await ref
            //             .read(doneHabitIdsProvider.notifier)
            //             .toggleDone(widget.habit.id);
            //         // ref.invalidate(
            //         //   checkinDayKeysForHabitProvider(widget.habit.id),
            //         // );
            //       },
            //     ),
            //     Text(
            //       'Mark as done',
            //       style: context.textTheme.bodyLarge?.copyWith(),
            //     ),
            //   ],
            // ),
            GestureDetector(
              onTap: () => ref
                  .read(doneHabitIdsProvider.notifier)
                  .toggleDone(widget.habit.id),
              child: Container(
                width: double.infinity,
                padding: EdgeInsetsGeometry.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isDone ? Colors.green : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isDone ? '✓ Done' : 'Mark as done',
                  textAlign: TextAlign.center,
                  //todo- change fontWeight to w500
                  style: context.body.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isDone ? Colors.white : Colors.black,
                  ),
                  // style: context.textTheme.bodyLarge?.copyWith(
                  //   color: isDone ? Colors.white : Colors.black,
                  // ),
                ),
              ),
            ),
            kSizedBoxH20,
            Divider(),
            //todo- change fontWeight to w500
            Text(
              'Last 7 days',
              style: context.body.copyWith(fontWeight: FontWeight.w500),
            ),
            // Text('Last 7 days', style: context.textTheme.bodyLarge?.copyWith()),
            kSizedBoxH5,
            LastSevenDaysDateSection(
              checkinDayKeysForHabit: optimizedCheckinDayKeys,
            ),
          ],
        ),
      ),
    );
  }
}

//. generate the last 7 days including today
//. hint: I can use dayKey but how?
