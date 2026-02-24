import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitera/constants/sizes.dart';
import 'package:habitera/features/habit_tracker/presentation/habit_provider.dart';

import 'package:habitera/utils/day_key.dart';
import 'package:habitera/utils/extensions.dart';
import 'package:intl/intl.dart';

class LastSevenDaysDateSection extends ConsumerWidget {
  LastSevenDaysDateSection({super.key, required this.habitId});

  final int habitId;

  List<int> generateLastSevendays() {
    final today = DateTime.now();
    return List.generate(7, (i) {
      final date = today.subtract(Duration(days: i));
      return dayKey(date);
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkinDayKeysForHabitAsync = ref.watch(
      checkinDayKeysForHabitProvider(habitId),
    );
    final checkinDayKeysForHabit = checkinDayKeysForHabitAsync.value ?? <int>{};
    print('checkin day keys: $checkinDayKeysForHabit');
    final dates = generateLastSevendays();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final isToday = index == 6;
        final isDone = checkinDayKeysForHabit.contains(dates[index]);

        return DetailsDateColumn(
          dates: dates,
          index: index,
          isToday: isToday,
          isDone: isDone,
        );
      }),
    );
  }
}

class DetailsDateColumn extends StatelessWidget {
  const DetailsDateColumn({
    super.key,
    required this.dates,
    required this.index,
    required this.isToday,
    required this.isDone,
  });

  final List<int> dates;
  final int index;
  final bool isToday;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    final labelMediumFSize14 = context.textTheme.labelMedium!.copyWith(
      fontSize: 14.0,
    );
    final date = dayKeyToDate(dates[index]);

    var weekDay = DateFormat('EEE').format(date);
    var dayNumber = date.day;
    // DateFormat.d().format(date)

    return Column(
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          decoration: isToday
              ? BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(13.0),
                )
              : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                weekDay.toLowerCase(),
                style: context.textTheme.labelMedium!.copyWith(
                  fontSize: 14.0,
                  fontWeight: isToday ? FontWeight.w700 : FontWeight.normal,
                ),
              ),
              Text('$dayNumber', style: labelMediumFSize14),
            ],
          ),
        ),
        kSizedBoxH10,
        Icon(isDone ? Icons.circle : Icons.circle_outlined, size: 15),
      ],
    );
  }
}
