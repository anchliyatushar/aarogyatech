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
    AppointmentRequestModel appointmentModel,
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

  Future<Responser<List<ScheduledAppointmentModel>>> fetchAppointments(
    DateTime date,
  ) async {
    try {
      final resp = await _httpService.get(
        AppointmentEndpoint.fetchAppointments,
        parmas: {
          'scheduled_date': date.formatDate('yyyy-MM-DD'),
          'doctor_id': '135',
        },
      );

      final data = resp.data as List;

      final formatedData = data
          .map((e) =>
              ScheduledAppointmentModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return Responser(
        message: resp.message,
        isSuccess: resp.isSuccess,
        data: formatedData,
      );
    } catch (e) {
      return Responser(isSuccess: false, message: 'Data Parsing Failed');
    }
  }
}
