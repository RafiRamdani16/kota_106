// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ScheduleModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) =>
    ScheduleModel()
      ..scheduleId = json['scheduleId'] as int
      ..name = json['name'] as String
      ..startCheckinAt = json['startCheckinAt'] as String
      ..endCheckinAt = json['endCheckinAt'] as String
      ..startCheckoutAt = json['startCheckoutAt'] as String
      ..endCheckoutAt = json['endCheckoutAt'] as String;

Map<String, dynamic> _$ScheduleModelToJson(ScheduleModel instance) =>
    <String, dynamic>{
      'scheduleId': instance.scheduleId,
      'name': instance.name,
      'startCheckinAt': instance.startCheckinAt,
      'endCheckinAt': instance.endCheckinAt,
      'startCheckoutAt': instance.startCheckoutAt,
      'endCheckoutAt': instance.endCheckoutAt,
    };
