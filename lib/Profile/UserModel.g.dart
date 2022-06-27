// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..userId = json['userId'] as int
  ..name = json['name'] as String
  ..religion = json['religion'] as String
  ..position = json['position'] as String
  ..gender = json['gender'] as String
  ..status = json['status'] as String
  ..joinDate = json['joinDate'] as String
  ..endDate = json['endDate'] as String
  ..phoneNumber = json['phoneNumber'] as String
  ..email = json['email'] as String
  ..address = json['address'] as String
  ..city = json['city'] as String
  ..noKtp = json['noKtp'] as String
  ..npwp = json['npwp'] as String
  ..dateOfBirth = json['dateOfBirth'] as String
  ..role = json['role'] as String
  ..password = json['password'] as String
  ..photoName = json['photoName'] as String
  ..superiorId = json['superiorId'] as int;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'religion': instance.religion,
      'position': instance.position,
      'gender': instance.gender,
      'status': instance.status,
      'joinDate': instance.joinDate,
      'endDate': instance.endDate,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'city': instance.city,
      'noKtp': instance.noKtp,
      'npwp': instance.npwp,
      'dateOfBirth': instance.dateOfBirth,
      'role': instance.role,
      'password': instance.password,
      'photoName': instance.photoName,
      'superiorId': instance.superiorId,
    };
