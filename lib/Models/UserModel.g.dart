// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..token = json['token'] as String
  ..refreshToken = json['refreshToken'] as String
  ..id = json['id'] as int
  ..name = json['name'] as String
  ..religion = json['religion'] as String
  ..position = json['position'] as String
  ..curentlySalary = json['curentlySalary'] as String
  ..status = json['status'] as String
  ..joinDate = json['joinDate'] as String
  ..endDate = json['endDate'] as String
  ..phoneNumber = json['phoneNumber'] as String
  ..email = json['email'] as String
  ..address = json['address'] as String
  ..city = json['city'] as String
  ..noKtp = json['noKtp'] as String
  ..npwp = json['npwp'] as String
  ..dateOfBirth = DateTime.parse(json['dateOfBirth'] as String)
  ..role = json['role'] as String
  ..image = json['image'] as String
  ..idSchedule = json['idSchedule'] as int;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'id': instance.id,
      'name': instance.name,
      'religion': instance.religion,
      'position': instance.position,
      'curentlySalary': instance.curentlySalary,
      'status': instance.status,
      'joinDate': instance.joinDate,
      'endDate': instance.endDate,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'city': instance.city,
      'noKtp': instance.noKtp,
      'npwp': instance.npwp,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'role': instance.role,
      'image': instance.image,
      'idSchedule': instance.idSchedule,
    };
