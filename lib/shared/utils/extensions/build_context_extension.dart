import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Future<DateTime?> showCalendarDialog({
    required DateTime firstDate,
    required DateTime lastDate,
  }) {
    return showDatePicker(
      context: this,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }
}
