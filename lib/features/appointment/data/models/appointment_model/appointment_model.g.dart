// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map json) => AppointmentModel(
      doctorId: json['doctor_id'] as String,
      patientId: json['patient_id'] as String,
      slotValue: json['slot_value'] as int,
      status: json['status'] as String,
      createdOn: json['created_on'] as String,
      scheduledDate: json['scheduled_date'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      createdBy: json['created_by'] as String,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctorId,
      'patient_id': instance.patientId,
      'slot_value': instance.slotValue,
      'status': instance.status,
      'created_on': instance.createdOn,
      'scheduled_date': instance.scheduledDate,
      'phone': instance.phone,
      'gender': instance.gender,
      'created_by': instance.createdBy,
    };
