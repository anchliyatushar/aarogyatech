import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime next() {
    return add(const Duration(days: 1));
  }

  int compareOnlyDate(DateTime other) {
    final date = this;
    var first = DateTime(other.year, other.month, other.day);
    var second = DateTime(date.year, date.month, date.day);
    return second.compareTo(first);
  }

  bool isSameDate(DateTime other) {
    return compareOnlyDate(other) == 0;
  }

  String formatDate(String parseFormat) {
    return DateFormat(parseFormat).format(this);
  }
}
