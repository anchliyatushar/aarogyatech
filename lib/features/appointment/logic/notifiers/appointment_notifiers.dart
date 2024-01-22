import 'package:aarogyatech/features/appointment/appointment.dart';
import 'package:flutter/material.dart';

class AppointmentNotifier with ChangeNotifier {
  final AppointmentRepo appointmentRepo;

  AppointmentNotifier(this.appointmentRepo);
}
