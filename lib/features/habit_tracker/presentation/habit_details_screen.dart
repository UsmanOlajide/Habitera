import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:habitera/features/habit_tracker/presentation/habit_provider.dart';
import 'package:habitera/features/habit_tracker/presentation/widgets/type_chip.dart';
import 'package:habitera/utils/created_date.dart';
import 'package:habitera/utils/extensions.dart';

class HabitDetailsScreen extends ConsumerStatefulWidget {
  const HabitDetailsScreen({
    super.key,
    required this.habit,
    // required this.type,
    // required this.habitTitle,
    // required this.createdAt,
    // required this.isDone,
    // required this.onChanged,
  });

  final HabitIsar habit;
  // final bool isDone;
  // final void Function(bool?)? onChanged;

  @override
  ConsumerState<HabitDetailsScreen> createState() => _HabitDetailsScreenState();
}

class _HabitDetailsScreenState extends ConsumerState<HabitDetailsScreen> {
  // final int type;
  @override
  Widget build(BuildContext context) {
    final doneHabitIdsAsync = ref.watch(doneHabitIdsProvider);
    final isDone =
        doneHabitIdsAsync.valueOrNull?.contains(widget.habit.id) ?? false;
    // final onChanged = ;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: padAll16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.habit.title,
              // style: context.textTheme.titleLarge?.copyWith(
              //   fontWeight: FontWeight.w400,
              // ),
              style: context.textTheme.titleLarge?.copyWith(
                // fontWeight: FontWeight.w400,
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
                  style: context.textTheme.bodyLarge?.copyWith(
                    // color: Colors.black38,
                    // color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            Text(
              'Last 7 days',
              style: context.textTheme.bodyLarge?.copyWith(
                // color: Colors.black38,
                // color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            kSizedBoxH5,
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.cancel, color: Colors.red),

                // SizedBox(width: 8),
                kSizedBoxH8,
                Text('Mon'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_rounded, color: Colors.green),
                kSizedBoxH20,
                Text('Tue'),
              ],
            ),
            Row(children: [Icon(Icons.cancel), Text('Wed')]),
            Row(children: [Icon(Icons.check_circle_rounded), Text('Thur')]),
            Row(children: [Icon(Icons.check_circle_rounded), Text('Fri')]),
            Row(children: [Icon(Icons.check_circle_rounded), Text('Sat')]),
            Row(children: [Icon(Icons.check_circle_rounded), Text('Sun')]),
          ],
        ),
      ),
    );
  }
}

final last7days = List.generate(7, (index) {
  return ;
});
