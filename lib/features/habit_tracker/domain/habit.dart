import 'package:habitera/constants/enums.dart';

class Habit {
  Habit({
    required this.id,
    required this.title,
    required this.type,
    required this.createdAt,
  });
  final String id;
  final String title;
  final HabitType type;
  final DateTime createdAt;
}

// class Habit {
//   Habit({
//     required this.id,
//     required this.name,
//     required this.startDate,
//     required this.completedDays,
//   });
  
//   final int id;
//   final String name;
//   final DateTime startDate;
//   final List<DateTime> completedDays;

//   Habit copyWith({
//     int? id,
//     String? name,
//     DateTime? startDate,
//     List<DateTime>? completedDays,
//   }) {
//     return Habit(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       startDate: startDate ?? this.startDate,
//       completedDays: completedDays ?? this.completedDays,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'name': name,
//       'startDate': startDate.millisecondsSinceEpoch,
//       'completedDays':
//           completedDays.map((x) => x.millisecondsSinceEpoch).toList(),
//     };
//   }

//   factory Habit.fromMap(Map<String, dynamic> map) {
//     return Habit(
//       id: map['id'] as int,
//       name: map['name'] as String,
//       startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate'] as int),
//       completedDays: List<DateTime>.from(
//         (map['completedDays'] as List<int>).map<DateTime>(
//           (x) => DateTime.fromMillisecondsSinceEpoch(x),
//         ),
//       ),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Habit.fromJson(String source) =>
//       Habit.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Habit(id: $id, name: $name, startDate: $startDate, completedDays: $completedDays)';
//   }

//   @override
//   bool operator ==(covariant Habit other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.name == name &&
//         other.startDate == startDate &&
//         listEquals(other.completedDays, completedDays);
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         name.hashCode ^
//         startDate.hashCode ^
//         completedDays.hashCode;
//   }
// }


// import 'dart:convert';

// class Habit {
//   Habit({
//     required this.title,
//   });

// // TODO: add more habit properties
//   final String title;

//   Habit copyWith({
//     String? title,
//   }) {
//     return Habit(
//       title: title ?? this.title,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'title': title,
//     };
//   }

//   factory Habit.fromMap(Map<String, dynamic> map) {
//     return Habit(
//       title: map['title'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Habit.fromJson(String source) => Habit.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'Habit(title: $title)';

//   @override
//   bool operator ==(covariant Habit other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.title == title;
//   }

//   @override
//   int get hashCode => title.hashCode;
// }



// //* I think i should work on the CRUD functions next

// //* ADD a habit
// //* To add a habit what are the things needed

// //* BASIC THINGS FIRST
// //* Title of the habit 
// //* 
// //*
// //*
// //*

