// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel()
  ..id = json['id'] as int
  ..superiorId = json['superiorId'] as int
  ..name = json['name'] as String
  ..position = json['position'] as String
  ..role = json['role'] as String
  ..photoName = json['photoName'] as String
  ..accessToken = json['accessToken'] as String
  ..refreshToken = json['refreshToken'] as String;

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'superiorId': instance.superiorId,
      'name': instance.name,
      'position': instance.position,
      'role': instance.role,
      'photoName': instance.photoName,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
