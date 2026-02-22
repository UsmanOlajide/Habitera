import 'package:flutter/material.dart';
import 'package:habitera/constants/sizes.dart';

import 'package:habitera/utils/day_key.dart';
import 'package:habitera/utils/extensions.dart';
import 'package:intl/intl.dart';

class LastSevenDaysDateSection extends StatelessWidget {
  LastSevenDaysDateSection({super.key});

  final today = DateTime.now();

  List<int> generateLastSevendays() {
    return List.generate(7, (i) {
      final date = today.subtract(Duration(days: i));
      return dayKey(date);
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    final dates = generateLastSevendays();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        return DetailsDateColumn(dates: dates, index: index, isToday: true);
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
  });

  final List<int> dates;
  final int index;
  final bool isToday;

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
        isToday
            ? Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      weekDay.toLowerCase(),
                      style: context.textTheme.labelMedium!.copyWith(
                        fontSize: 14.0,
                        fontWeight: isToday
                            ? FontWeight.w700
                            : FontWeight.normal,
                      ),
                    ),
                    Text('$dayNumber', style: labelMediumFSize14),
                  ],
                ),
              )
            : SizedBox(
                width: 40.0,
                height: 40.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weekDay.toLowerCase(),
                      style: context.textTheme.labelMedium!.copyWith(
                        fontSize: 14.0,
                        fontWeight: isToday
                            ? FontWeight.w700
                            : FontWeight.normal,
                      ),
                    ),
                    Text('$dayNumber', style: labelMediumFSize14),
                  ],
                ),
              ),
        kSizedBoxH10,
        isToday
            ? Icon(Icons.circle, size: 15)
            : Icon(Icons.circle_outlined, size: 15),
      ],
    );
  }
}
