// DateTime dayOnly(DateTime date) {
//   //* convert the date to the local timezone of the user
//   final local = date.toLocal();
//   return DateTime(local.year, local.month, local.day);
// }

int dayKey(DateTime date) {
  final local = date.toLocal();
  return local.year * 10000 + local.month * 100 + local.day;
  //. YYYYMMDD
}