class AppointmentEndpoint {
  static const _baseUrl =
      'https://oh5oe1gr6i.execute-api.ap-south-1.amazonaws.com/dev/admin/test';

  static const appointmentEndpoint = '${_baseUrl}create-patient';

  static const scheduleAppointmentEndpoint = '$_baseUrl/';

  static const fetchAppointments = _baseUrl;
}
