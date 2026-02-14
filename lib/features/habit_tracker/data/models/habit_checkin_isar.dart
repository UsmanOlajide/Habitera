import 'package:isar/isar.dart';

part 'habit_checkin_isar.g.dart';

@collection
class HabitCheckinIsar {
  Id id = Isar.autoIncrement;

  @Index()
  late int habitId;

  @Index()
  late int dayKey;
  // late DateTime day;

}