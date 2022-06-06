// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaveApplicationDecisionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveApplicationDecisionModel _$LeaveApplicationDecisionModelFromJson(
        Map<String, dynamic> json) =>
    LeaveApplicationDecisionModel()
      ..employeeName = json['employeeName'] as String
      ..employeePosition = json['employeePosition'] as String
      ..leaveRemainingDays = json['leaveRemainingDays'] as String
      ..leaveType = json['leaveType'] as String
      ..leaveTimeSubmitted = json['leaveTimeSubmitted'] as String
      ..leaveDateSubmitted = json['leaveDateSubmitted'] as String
      ..leaveStartDate = json['leaveStartDate'] as String
      ..leaveEndDate = json['leaveEndDate'] as String
      ..leaveDescription = json['leaveDescription'] as String
      ..leaveAttachment = json['leaveAttachment'] as String
      ..leaveStatus = json['leaveStatus'] as String;

Map<String, dynamic> _$LeaveApplicationDecisionModelToJson(
        LeaveApplicationDecisionModel instance) =>
    <String, dynamic>{
      'employeeName': instance.employeeName,
      'employeePosition': instance.employeePosition,
      'leaveRemainingDays': instance.leaveRemainingDays,
      'leaveType': instance.leaveType,
      'leaveTimeSubmitted': instance.leaveTimeSubmitted,
      'leaveDateSubmitted': instance.leaveDateSubmitted,
      'leaveStartDate': instance.leaveStartDate,
      'leaveEndDate': instance.leaveEndDate,
      'leaveDescription': instance.leaveDescription,
      'leaveAttachment': instance.leaveAttachment,
      'leaveStatus': instance.leaveStatus,
    };
