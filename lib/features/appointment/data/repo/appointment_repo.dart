import 'package:aarogyatech/features/appointment/appointment.dart';
import 'package:aarogyatech/shared/shared.dart';

class AppointmentRepo {
  final _httpService = AppUtils.locator.get<AppHttpService>();

  Future<Responser> bookAppointment(UserModel userModel) async {
    try {
      final resp = await _httpService.post(
        AppointmentEndpoint.appointmentEndpoint,
        data: userModel.toJson(),
      );

      return Responser(
        message: resp.message,
        isSuccess: resp.isSuccess,
      );
    } catch (e) {
      return Responser(isSuccess: false, message: 'Data Parsing Failed');
    }
  }

  Future<Responser> scheduleAppointment(
    ScheduledAppointmentModel appointmentModel,
  ) async {
    try {
      final resp = await _httpService.post(
        AppointmentEndpoint.scheduleAppointmentEndpoint,
        data: appointmentModel.toJson(),
      );

      return Responser(
        message: resp.message,
        isSuccess: resp.isSuccess,
      );
    } catch (e) {
      return Responser(isSuccess: false, message: 'Data Parsing Failed');
    }
  }

  Future<Responser> fetchAppointments(DateTime date) async {
    try {
      final resp = await _httpService.get(
        AppointmentEndpoint.scheduleAppointmentEndpoint,
        parmas: {
          'scheduled_date': date.formatDate('yyyy-mm-dd'),
          'doctor_id': 135,
        },
      );

      return Responser(
        message: resp.message,
        isSuccess: resp.isSuccess,
      );
    } catch (e) {
      return Responser(isSuccess: false, message: 'Data Parsing Failed');
    }
  }
}
