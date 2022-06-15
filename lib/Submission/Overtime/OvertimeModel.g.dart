// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OvertimeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OvertimeModel _$OvertimeModelFromJson(Map<String, dynamic> json) =>
    OvertimeModel()
      ..overtimeId = json['overtimeId'] as int
      ..userId = json['userId'] as int
      ..afterOvertimeId = json['afterOvertimeId'] as int
      ..dateSubmit = json['dateSubmit'] as String
      ..dateOvertime = json['dateOvertime'] as String
      ..startTime = json['startTime'] as String
      ..endTime = json['endTime'] as String
      ..description = json['description'] as String
      ..statusOvertime = json['statusOvertime'] as String;

Map<String, dynamic> _$OvertimeModelToJson(OvertimeModel instance) =>
    <String, dynamic>{
      'overtimeId': instance.overtimeId,
      'userId': instance.userId,
      'afterOvertimeId': instance.afterOvertimeId,
      'dateSubmit': instance.dateSubmit,
      'dateOvertime': instance.dateOvertime,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'description': instance.description,
      'statusOvertime': instance.statusOvertime,
    };
