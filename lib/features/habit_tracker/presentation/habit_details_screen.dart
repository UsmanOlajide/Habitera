import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:habitera/features/habit_tracker/presentation/habit_provider.dart';
import 'package:habitera/features/habit_tracker/presentation/widgets/last_seven_days_date_section.dart';
import 'package:habitera/features/habit_tracker/presentation/widgets/type_chip.dart';
import 'package:habitera/utils/created_date.dart';
import 'package:habitera/utils/extensions.dart';

class HabitDetailsScreen extends ConsumerStatefulWidget {
  const HabitDetailsScreen({super.key, required this.habit});

  final HabitIsar habit;

  @override
  ConsumerState<HabitDetailsScreen> createState() => _HabitDetailsScreenState();
}

class _HabitDetailsScreenState extends ConsumerState<HabitDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final doneHabitIdsAsync = ref.watch(doneHabitIdsProvider);
    final isDone =
        doneHabitIdsAsync.valueOrNull?.contains(widget.habit.id) ?? false;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: padAll16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.habit.title,
              style: context.textTheme.titleLarge?.copyWith(
                fontSize: 18,
              ),
            ),
            kSizedBoxH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                TypeChip(type: widget.habit.type),
                Text(
                  'Daily • ${createdDate(widget.habit.createdAt)}',
                  style: context.textTheme.bodySmall?.copyWith(
                    // color: Colors.black38,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            kSizedBoxH10,
            Row(
              children: [
                Checkbox(
                  value: isDone,
                  activeColor: Colors.green,
                  onChanged: (value) async {
                    final checkinRepo = ref.read(checkinRepositoryProvider);
                    await checkinRepo.toggleDone(widget.habit.id);
                    ref.invalidate(doneHabitIdsProvider);
                  },
                ),
                Text(
                  'Mark as done',
                  style: context.textTheme.bodyLarge?.copyWith(),
                ),
              ],
            ),
            Text('Last 7 days', style: context.textTheme.bodyLarge?.copyWith()),
            kSizedBoxH5,
            LastSevenDaysDateSection(),
          ],
        ),
      ),
    );
  }
}

//. generate the last 7 days including today
//. hint: I can use dayKey but how?
