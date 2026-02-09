import 'package:habitera/features/habit_tracker/data/models/habit_checkin_isar.dart';
import 'package:habitera/features/habit_tracker/data/models/habit_isar.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  static late Isar isar;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([
      HabitIsarSchema,
      HabitCheckinIsarSchema,
    ], directory: dir.path);
  }
}
