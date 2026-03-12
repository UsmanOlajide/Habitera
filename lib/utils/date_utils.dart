int dayKey(DateTime date) {
  final local = date.toLocal();
  return local.year * 10000 + local.month * 100 + local.day;
  //. YYYYMMDD
}

DateTime dayKeyToDate(int dayKey) {
  final year = dayKey ~/ 10000;
  final month = (dayKey % 10000) ~/ 100;
  final day = dayKey % 100;
  return DateTime(year, month, day);
}

int calculateStreak(Set<int> completedDayKeys) {
  var currentDay = dayKey(DateTime.now());
  var streak = 0;

  while (completedDayKeys.contains(currentDay)) {
    final dayBeforeDateTime = dayKeyToDate(currentDay).subtract(Duration(days: 1));
    currentDay = dayKey(dayBeforeDateTime);
    streak++;
  }
  return streak;
}
