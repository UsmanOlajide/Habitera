// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'habit_isar.g.dart';

@collection
class HabitIsar {
  Id id = Isar.autoIncrement;
  late String title;
  late int type;
  late DateTime createdAt;
  late int frequency;

  @override
  String toString() {
    return 'HabitIsar(id: $id, title: $title, type: $type, createdAt: $createdAt)';
  }
}
