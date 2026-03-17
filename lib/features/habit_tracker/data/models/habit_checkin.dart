
class HabitCheckin {
  HabitCheckin({
    required this.habitId,
    required this.dayKey,
  });

  final String habitId;
  final int dayKey;


  HabitCheckin copyWith({
    String? habitId,
    int? dayKey,
  }) {
    return HabitCheckin(
      habitId: habitId ?? this.habitId,
      dayKey: dayKey ?? this.dayKey,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'habit_id': habitId,
      'day_key': dayKey,
    };
  }

  factory HabitCheckin.fromMap(Map<String, dynamic> map) {
    return HabitCheckin(
      habitId: map['habit_id'] as String,
      dayKey: map['day_key'] as int,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory HabitCheckin.fromJson(String source) => HabitCheckin.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() => 'HabitCheckin(habitId: $habitId, dayKey: $dayKey)';

  // @override
  // bool operator ==(covariant HabitCheckin other) {
  //   if (identical(this, other)) return true;
  
  //   return 
  //     other.habitId == habitId &&
  //     other.dayKey == dayKey;
  // }

  // @override
  // int get hashCode => habitId.hashCode ^ dayKey.hashCode;
}
