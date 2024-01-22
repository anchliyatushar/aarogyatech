import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserModel {
  @JsonKey(name: 'full_name')
  String fullName;

  String phone;
  String gender;

  UserModel({
    required this.fullName,
    required this.phone,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
