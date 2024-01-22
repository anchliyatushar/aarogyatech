// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'appointment_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class AppointmentModel {
  @JsonKey(name: 'doctor_id')
  String doctorId;
  @JsonKey(name: 'patient_id')
  String patientId;
  @JsonKey(name: 'slot_value')
  int slotValue;
  String status;
  @JsonKey(name: 'created_on')
  String createdOn;
  @JsonKey(name: 'scheduled_date')
  String scheduledDate;
  String phone;
  String gender;
  @JsonKey(name: 'created_by')
  String createdBy;

  AppointmentModel({
    required this.doctorId,
    required this.patientId,
    required this.slotValue,
    required this.status,
    required this.createdOn,
    required this.scheduledDate,
    required this.phone,
    required this.gender,
    required this.createdBy,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}
