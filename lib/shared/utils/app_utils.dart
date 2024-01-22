import 'package:aarogyatech/features/appointment/appointment.dart';
import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppUtils {
  static final locator = GetIt.instance;

  static void setupLocator() async {
    _registerServices();
    _registerRepo();
    _registerNotifiers();
  }

  static void _registerServices() {
    locator.registerLazySingleton(() => AppHttpService());
  }

  static void _registerRepo() {
    locator.registerLazySingleton(() => AppointmentRepo());
  }

  static void _registerNotifiers() {
    locator.registerLazySingleton(
      () => AppointmentNotifier(locator.get<AppointmentRepo>()),
    );
  }

  static void showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void removeSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
