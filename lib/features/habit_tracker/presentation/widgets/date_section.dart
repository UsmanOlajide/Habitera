import 'package:flutter/material.dart';
import 'package:habitera/utils/extensions.dart';
import 'package:intl/intl.dart';

class DateSection extends StatelessWidget {
  DateSection({super.key});

  final today = DateTime.now();

  List<Map<String, String>> generateWeekDates() {
    List<Map<String, String>> weekDates = [];
    for (var i = 0; i < 7; i++) {
      final date = today.add(
        Duration(days: i - today.weekday + 1), // to get the dates
      );
      var weekDay = DateFormat('EEE').format(date); // format Mon
      var weekDate = DateFormat.d().format(date); // format 30

      weekDates.add({
        'day': weekDay,
        'date': weekDate,
      });
    }
    return weekDates;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        7,
        (index) {
          final dates = generateWeekDates();
          bool isToday = dates[index]['date'] == today.day.toString();
          return isToday
              ? Container(
                  width: 40.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: DateColumn(
                    dates: dates,
                    index: index,
                  ),
                )
              : DateColumn(
                  dates: dates,
                  index: index,
                );
        },
      ),
    );
  }
}

class DateColumn extends StatelessWidget {
  const DateColumn({
    super.key,
    required this.dates,
    required this.index,
  });

  final List<Map<String, String>> dates;
  final int index;

  @override
  Widget build(BuildContext context) {
    final labelMediumFSize14 =
        context.textTheme.labelMedium!.copyWith(fontSize: 14.0);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dates[index]['day']!.toLowerCase(),
          style: labelMediumFSize14,
        ),
        Text(
          '${dates[index]['date']}',
          style: labelMediumFSize14,
        ),
      ],
    );
  }
}
