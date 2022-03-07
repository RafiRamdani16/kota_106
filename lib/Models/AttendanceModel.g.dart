// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttendanceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) =>
    AttendanceModel()
      ..id = json['id'] as int
      ..isLate = json['isLate'] as String
      ..checkinAt = json['checkinAt'] as String
      ..locationCheckin = json['locationCheckin'] as String
      ..descriptionCheckin = json['descriptionCheckin'] as String
      ..checkoutAt = json['checkoutAt'] as String
      ..locationCheckout = json['locationCheckout'] as String
      ..descriptionCheckout = json['descriptionCheckout'] as String
      ..photoName = json['photoName'] as String
      ..scheduleId = json['scheduleId'] as int
      ..userId = json['userId'] as int;

Map<String, dynamic> _$AttendanceModelToJson(AttendanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isLate': instance.isLate,
      'checkinAt': instance.checkinAt,
      'locationCheckin': instance.locationCheckin,
      'descriptionCheckin': instance.descriptionCheckin,
      'checkoutAt': instance.checkoutAt,
      'locationCheckout': instance.locationCheckout,
      'descriptionCheckout': instance.descriptionCheckout,
      'photoName': instance.photoName,
      'scheduleId': instance.scheduleId,
      'userId': instance.userId,
    };
