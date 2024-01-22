// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'appointment_request_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class AppointmentRequestModel {
  @JsonKey(name: 'doctor_id')
  String doctorId;
  @JsonKey(name: 'patient_id')
  String patientId;
  @JsonKey(name: 'slot_value')
  String slotValue;
  String status;
  @JsonKey(name: 'created_on')
  String createdOn;
  @JsonKey(name: 'scheduled_date')
  String scheduledDate;
  @JsonKey(name: 'created_by')
  String createdBy;

  AppointmentRequestModel({
    required this.doctorId,
    required this.patientId,
    required this.slotValue,
    required this.status,
    required this.createdOn,
    required this.scheduledDate,
    required this.createdBy,
  });

  factory AppointmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentRequestModelToJson(this);
}
