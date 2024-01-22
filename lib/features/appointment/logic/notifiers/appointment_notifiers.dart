import 'package:aarogyatech/features/appointment/appointment.dart';
import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';

class AppointmentNotifier with ChangeNotifier {
  final AppointmentRepo appointmentRepo;

  AppointmentNotifier(this.appointmentRepo);

  Future<Responser> bookAppointment(UserModel userModel) async {
    return appointmentRepo.bookAppointment(userModel);
  }

  Future<Responser> scheduleAppointment(
    ScheduledAppointmentModel appointmentModel,
  ) {
    return appointmentRepo.scheduleAppointment(appointmentModel);
  }

  Future<Responser> fetchAppointments(DateTime date) async {
    return appointmentRepo.fetchAppointments(date);
  }
}
