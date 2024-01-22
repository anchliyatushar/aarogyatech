// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduledAppointmentModel _$ScheduledAppointmentModelFromJson(Map json) =>
    ScheduledAppointmentModel(
      patientId: json['patient_id'] as String,
      fullName: json['full_name'] as String,
      firstName: json['first_name'] as String,
      phone: json['phone'] as String,
      dateOfBirth: json['date_of_birth'] as String,
      address: json['address'] as String,
      height: json['height'] as String,
      weight: json['weight'] as String,
      gender: json['gender'] as String,
      slotValue: json['slot_value'] as String,
      status: json['status'] as String,
      scheduledDate: json['scheduled_date'] as String,
    );

Map<String, dynamic> _$ScheduledAppointmentModelToJson(
        ScheduledAppointmentModel instance) =>
    <String, dynamic>{
      'patient_id': instance.patientId,
      'full_name': instance.fullName,
      'first_name': instance.firstName,
      'phone': instance.phone,
      'date_of_birth': instance.dateOfBirth,
      'address': instance.address,
      'height': instance.height,
      'weight': instance.weight,
      'gender': instance.gender,
      'slot_value': instance.slotValue,
      'status': instance.status,
      'scheduled_date': instance.scheduledDate,
    };
