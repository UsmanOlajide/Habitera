// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';

class HabitDetailsArgs {
  HabitDetailsArgs({
    required this.habit,
    required this.isDone,
    required this.onChanged,
  });
  final HabitIsar habit;
  final bool isDone;
  final void Function(bool?)? onChanged;
}
