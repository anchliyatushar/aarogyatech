enum AppointmentSlotEnum {
  AM,
  PM;

  bool get isAM => this == AM;

  List<int> get hoursList => isAM ? [8, 9, 10, 11] : [5, 6, 7, 8];
}
