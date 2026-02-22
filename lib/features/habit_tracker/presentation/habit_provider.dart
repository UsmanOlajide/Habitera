import 'package:habitera/constants/enums.dart';
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:habitera/features/habit_tracker/data/repositories/checkin_repository.dart';
import 'package:habitera/features/habit_tracker/data/repositories/habit_repository.dart';
// import 'package:habitera/features/habit_tracker/domain/habit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'habit_provider.g.dart';

@riverpod
Future<List<HabitIsar>> habits(HabitsRef ref) async {
  final repo = ref.read(habitRepositoryProvider);
  return repo.getHabits();
}

@riverpod
HabitRepository habitRepository(HabitRepositoryRef ref) {
  return HabitRepository();
}

@riverpod
CheckinRepository checkinRepository(CheckinRepositoryRef ref) {
  return CheckinRepository();
}

@riverpod
Future<Set<int>> doneHabitIds(DoneHabitIdsRef ref) async {
  final repo = ref.read(checkinRepositoryProvider);
  return repo.doneHabitIdsToday();
}