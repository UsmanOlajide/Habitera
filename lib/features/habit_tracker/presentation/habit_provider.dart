import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:habitera/features/habit_tracker/data/repositories/checkin_repository.dart';
import 'package:habitera/features/habit_tracker/data/repositories/habit_repository.dart';
// import 'package:habitera/features/habit_tracker/domain/habit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'habit_provider.g.dart';

@riverpod
class Habits extends _$Habits {
  late HabitRepository _repo;
  @override
  Future<List<HabitIsar>> build() async {
    _repo = ref.read(habitRepositoryProvider);
    return await _repo.getHabits();
  }

  Future<void> addHabit(HabitIsar habit) async {
    await _repo.addHabit(habit);
    ref.invalidateSelf();
  }

  Future<void> editHabit(HabitIsar habit) async {
    await _repo.editHabit(habit);
    ref.invalidateSelf();
  }

  Future<void> deleteHabit(int habitId) async {
    await _repo.deleteHabit(habitId);
    ref.invalidateSelf();
  }
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
class DoneHabitIds extends _$DoneHabitIds {
  late CheckinRepository _repo;

  @override
  Future<Set<int>> build() async {
    _repo = ref.read(checkinRepositoryProvider);
    return await _repo.doneHabitIdsToday();
  }

  Future<void> toggleDone(int habitId) async {
    await _repo.toggleDone(habitId);
    ref.invalidateSelf();
  }
}

@riverpod
Future<Set<int>> checkinDayKeysForHabit(
  CheckinDayKeysForHabitRef ref,
  int habitId,
) async {
  final repo = ref.read(checkinRepositoryProvider);
  return await repo.getCheckinDayKeysForHabit(habitId);
}
