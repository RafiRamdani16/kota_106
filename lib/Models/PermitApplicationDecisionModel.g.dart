// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PermitApplicationDecisionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermitApplicationDecisionModel _$PermitApplicationDecisionModelFromJson(
        Map<String, dynamic> json) =>
    PermitApplicationDecisionModel()
      ..employeeName = json['employeeName'] as String
      ..employeePosition = json['employeePosition'] as String
      ..permitDateSubmitted = json['permitDateSubmitted'] as String
      ..permitTimeSubmitted = json['permitTimeSubmitted'] as String
      ..permitDate = json['permitDate'] as String
      ..permitStartTime = json['permitStartTime'] as String
      ..permitEndTime = json['permitEndTime'] as String
      ..permitDescription = json['permitDescription'] as String
      ..permitAttachment = json['permitAttachment'] as String
      ..statusPermit = json['statusPermit'] as String;

Map<String, dynamic> _$PermitApplicationDecisionModelToJson(
        PermitApplicationDecisionModel instance) =>
    <String, dynamic>{
      'employeeName': instance.employeeName,
      'employeePosition': instance.employeePosition,
      'permitDateSubmitted': instance.permitDateSubmitted,
      'permitTimeSubmitted': instance.permitTimeSubmitted,
      'permitDate': instance.permitDate,
      'permitStartTime': instance.permitStartTime,
      'permitEndTime': instance.permitEndTime,
      'permitDescription': instance.permitDescription,
      'permitAttachment': instance.permitAttachment,
      'statusPermit': instance.statusPermit,
    };
