DateTime dayOnly(DateTime date) {
  //* convert the date to the local timezone of the user
  final local = date.toLocal();
  return DateTime(local.year, local.month, local.day);
}

// int dayKey(DateTime date) {
//   //* convert the date to the local timezone of the user
//   final local = date.toLocal();
//   return DateTime(local.year, local.month, local.day);
// }