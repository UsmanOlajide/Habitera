import 'package:habitera/constants/enums.dart';
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:habitera/features/habit_tracker/presentation/habit_repository.dart';
// import 'package:habitera/features/habit_tracker/domain/habit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'habit_provider.g.dart';

@riverpod
HabitRepository habitRepository(HabitRepositoryRef ref) {
  return HabitRepository();
}
// all i did here is to create a provider for the habit repository
// to create an instance of the repository

@riverpod
Future<List<HabitIsar>> habits(HabitsRef ref) async {
  final repo = ref.read(habitRepositoryProvider);
  return await repo.getHabits();
}
// all i did here is to create a provider to return the habits