// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OvertimeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OvertimeModel _$OvertimeModelFromJson(Map<String, dynamic> json) =>
    OvertimeModel()
      ..idOvertime = json['idOvertime'] as int
      ..overtimeDateSubmitted = json['overtimeDateSubmitted'] as String
      ..overtimeTimeSubmitted = json['overtimeTimeSubmitted'] as String
      ..overtimeDate = json['overtimeDate'] as String
      ..overtimeStartTime = json['overtimeStartTime'] as String
      ..overtimeEndTime = json['overtimeEndTime'] as String
      ..overtimeDescription = json['overtimeDescription'] as String
      ..overtimeStatus = json['overtimeStatus'] as String;

Map<String, dynamic> _$OvertimeModelToJson(OvertimeModel instance) =>
    <String, dynamic>{
      'idOvertime': instance.idOvertime,
      'overtimeDateSubmitted': instance.overtimeDateSubmitted,
      'overtimeTimeSubmitted': instance.overtimeTimeSubmitted,
      'overtimeDate': instance.overtimeDate,
      'overtimeStartTime': instance.overtimeStartTime,
      'overtimeEndTime': instance.overtimeEndTime,
      'overtimeDescription': instance.overtimeDescription,
      'overtimeStatus': instance.overtimeStatus,
    };
