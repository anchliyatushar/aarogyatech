// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map json) => UserModel(
      fullName: json['full_name'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'full_name': instance.fullName,
      'phone': instance.phone,
      'gender': instance.gender,
    };
