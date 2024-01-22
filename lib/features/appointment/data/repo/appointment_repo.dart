import 'package:aarogyatech/features/appointment/appointment.dart';
import 'package:aarogyatech/shared/shared.dart';

class AppointmentRepo {
  final _httpService = AppUtils.locator.get<AppHttpService>();

  Future<Responser> bookAppointment() async {
    try {
      final resp = await _httpService.post(
        AppointmentEndpoint.appointmentEndpoint,
        data: {
          'full_name': 'hello world', // Patients name
          'phone': '9002134563', // Patients phone number
          'gender': 'Male' // Patients gender
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
