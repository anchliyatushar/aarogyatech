// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentRequestModel _$AppointmentRequestModelFromJson(Map json) =>
    AppointmentRequestModel(
      doctorId: json['doctor_id'] as String,
      patientId: json['patient_id'] as String,
      slotValue: json['slot_value'] as String,
      status: json['status'] as String,
      createdOn: json['created_on'] as String,
      scheduledDate: json['scheduled_date'] as String,
      createdBy: json['created_by'] as String,
    );

Map<String, dynamic> _$AppointmentRequestModelToJson(
        AppointmentRequestModel instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      'patient_id': instance.patientId,
      'slot_value': instance.slotValue,
      'status': instance.status,
      'created_on': instance.createdOn,
      'scheduled_date': instance.scheduledDate,
      'created_by': instance.createdBy,
    };
