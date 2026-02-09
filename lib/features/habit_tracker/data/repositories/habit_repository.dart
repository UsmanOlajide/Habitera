// will handle all isar operations so the ui doesn't handle that
// will handle saving and loading of habits from the database so the ui doesn't need to know how data is stored
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:habitera/isar_service.dart';
import 'package:isar/isar.dart';

class HabitRepository {
  // add habit
  Future<void> addHabit(HabitIsar habit) async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.habitIsars.put(habit);
    });
  }

  Future<void> editHabit(HabitIsar habit) async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.habitIsars.put(habit);
    });
  }

  // to load habits
  Future<List<HabitIsar>> getHabits() async {
    return await IsarService.isar.habitIsars.where().findAll();
  }

  Future<void> deleteHabit(int habitId) async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.habitIsars.delete(habitId);
    });
  }
}
