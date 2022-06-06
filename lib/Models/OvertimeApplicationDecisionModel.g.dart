// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OvertimeApplicationDecisionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OvertimeApplicationDecisionModel _$OvertimeApplicationDecisionModelFromJson(
        Map<String, dynamic> json) =>
    OvertimeApplicationDecisionModel()
      ..employeeName = json['employeeName'] as String
      ..employeePosition = json['employeePosition'] as String
      ..overtimeDateSubmitted = json['overtimeDateSubmitted'] as String
      ..overtimeTimeSubmitted = json['overtimeTimeSubmitted'] as String
      ..overtimeDate = json['overtimeDate'] as String
      ..overtimeStartTime = json['overtimeStartTime'] as String
      ..overtimeEndTime = json['overtimeEndTime'] as String
      ..overtimeDescription = json['overtimeDescription'] as String
      ..overtimeAttachment = json['overtimeAttachment'] as String
      ..overtimeStatus = json['overtimeStatus'] as String;

Map<String, dynamic> _$OvertimeApplicationDecisionModelToJson(
        OvertimeApplicationDecisionModel instance) =>
    <String, dynamic>{
      'employeeName': instance.employeeName,
      'employeePosition': instance.employeePosition,
      'overtimeDateSubmitted': instance.overtimeDateSubmitted,
      'overtimeTimeSubmitted': instance.overtimeTimeSubmitted,
      'overtimeDate': instance.overtimeDate,
      'overtimeStartTime': instance.overtimeStartTime,
      'overtimeEndTime': instance.overtimeEndTime,
      'overtimeDescription': instance.overtimeDescription,
      'overtimeAttachment': instance.overtimeAttachment,
      'overtimeStatus': instance.overtimeStatus,
    };
