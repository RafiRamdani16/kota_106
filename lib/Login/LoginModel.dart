import 'package:json_annotation/json_annotation.dart';
part 'LoginModel.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey()
  late int id;
  @JsonKey()
  late int superiorId;
  @JsonKey()
  late String name;
  @JsonKey()
  late String position;
  @JsonKey()
  late String role;
  @JsonKey()
  late String photoName;
  @JsonKey()
  late String accessToken;
  @JsonKey()
  late String refreshToken;

  LoginModel();

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
