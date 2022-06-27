import 'package:json_annotation/json_annotation.dart';
part 'UserModel.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey()
  late int userId;
 
  @JsonKey()
  late String name;
  @JsonKey()
  late String religion;
  @JsonKey()
  late String position;
    @JsonKey()
  late String gender;
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
  late String dateOfBirth;
  @JsonKey()
  late String role;
  @JsonKey()
  late String password;
  @JsonKey()
  late String photoName;
  @JsonKey()
  late int superiorId;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
