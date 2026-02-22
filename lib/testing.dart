import 'package:habitera/utils/day_key.dart';
import 'package:intl/intl.dart';

final today = DateTime.now();

// List<Map<String, String>> generateLastSevendays() {
//   List<Map<String, String>> weekDates = [];
//   for (var i = 0; i < 7; i++) {
//     final date = today.subtract(Duration(days: i - today.weekday + 3));
//     var weekDay = DateFormat('EEE').format(date); // format Mon
//     var weekDate = DateFormat.d().format(date); // format 30

//     weekDates.add({'day': weekDay, 'date': weekDate});
//   }
//   return weekDates.reversed.toList();
// }

  List<int> generateLastSevendays() {
    return List.generate(7, (i) {
      final date = today.subtract(Duration(days: i));
      return dayKey(date);
    }).reversed.toList();
  }

void main(List<String> args) {
  // for (var i = 0; i < 7; i++) {
  //   print('$i ${today.subtract(Duration(days: i - today.weekday + 3))}');
  // }
  print(generateLastSevendays());
  //   for (var i = 0; i < 7; i++) {
  //   final date = today.subtract(Duration(days: i));
  //   // var weekDay = DateFormat('EEE').format(date); // format Mon
  //   // var weekDate = DateFormat.d().format(date); // format 30

  //   // weekDates.add({'day': weekDay, 'date': weekDate});
  //   print(date);
  // }
}
