import 'package:json_annotation/json_annotation.dart';
part "UserModel.g.dart";

@JsonSerializable()
class UserModel {
  @JsonKey()
  late String token;
  @JsonKey()
  late String refreshToken;
  @JsonKey()
  late int id;
  @JsonKey()
  late String name;
  @JsonKey()
  late String religion;
  @JsonKey()
  late String position;
  @JsonKey()
  late String curentlySalary;
  @JsonKey()
  late String status;
  @JsonKey()
  late String joinDate;
  @JsonKey()
  late String endDate;
  @JsonKey()
  late String phoneNumber;
  @JsonKey()
  late String email;
  @JsonKey()
  late String address;
  @JsonKey()
  late String city;
  @JsonKey()
  late String noKtp;
  @JsonKey()
  late String npwp;
  @JsonKey()
  late DateTime dateOfBirth;
  @JsonKey()
  late String role;
  @JsonKey()
  late String image;
  @JsonKey()
  late int idSchedule;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
