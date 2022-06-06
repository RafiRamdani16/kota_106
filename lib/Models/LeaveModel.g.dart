// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaveModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveModel _$LeaveModelFromJson(Map<String, dynamic> json) => LeaveModel()
  ..leaveRemainingDays = json['leaveRemainingDays'] as String
  ..leaveType = json['leaveType'] as String
  ..leaveTimeSubmitted = json['leaveTimeSubmitted'] as String
  ..leaveDateSubmitted = json['leaveDateSubmitted'] as String
  ..leaveStartDate = json['leaveStartDate'] as String
  ..leaveEndDate = json['leaveEndDate'] as String
  ..leaveDescription = json['leaveDescription'] as String
  ..leaveAttachment = json['leaveAttachment'] as String
  ..leaveStatus = json['leaveStatus'] as String;

Map<String, dynamic> _$LeaveModelToJson(LeaveModel instance) =>
    <String, dynamic>{
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
