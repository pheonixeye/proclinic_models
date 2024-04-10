// String formatDate(String date) {
//   final d = DateTime.parse(date);
//   return "${d.day}-${d.month}-${d.year} - ${formatTime(d.hour, d.minute)}";
// }

String formatDateWithoutTime(String date) {
  final d = DateTime.parse(date);
  return "${d.day}-${d.month}-${d.year}";
}
