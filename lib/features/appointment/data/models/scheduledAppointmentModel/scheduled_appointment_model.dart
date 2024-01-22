import 'package:json_annotation/json_annotation.dart';
part 'scheduled_appointment_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ScheduledAppointmentModel {
  @JsonKey(name: 'patient_id')
  String patientId;

  @JsonKey(name: 'full_name')
  String fullName;

  @JsonKey(name: 'first_name')
  String firstName;

  String phone;

  @JsonKey(name: 'date_of_birth')
  String dateOfBirth;

  String address;
  String height;
  String weight;
  String gender;

  @JsonKey(name: 'slot_value')
  String slotValue;

  String status;

  @JsonKey(name: 'scheduled_date')
  String scheduledDate;

  ScheduledAppointmentModel({
    required this.patientId,
    required this.fullName,
    required this.firstName,
    required this.phone,
    required this.dateOfBirth,
    required this.address,
    required this.height,
    required this.weight,
    required this.gender,
    required this.slotValue,
    required this.status,
    required this.scheduledDate,
  });

  factory ScheduledAppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduledAppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduledAppointmentModelToJson(this);
}
