// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaveModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveModel _$LeaveModelFromJson(Map<String, dynamic> json) => LeaveModel()
  ..leaveId = json['leaveId'] as int
  ..userId = json['userId'] as int
  ..leaveDateSubmitted = json['leaveDateSubmitted'] as String
  ..leaveStartDate = json['leaveStartDate'] as String
  ..leaveEndDate = json['leaveEndDate'] as String
  ..leaveType = json['leaveType'] as String
  ..leaveDescription = json['leaveDescription'] as String
  ..leaveAttachment = json['leaveAttachment'] as String
  ..leaveStatus = json['leaveStatus'] as String
  ..nameApprovalAdmin = json['nameApprovalAdmin'] as String
  ..nameApprovalHR = json['nameApprovalHR'] as String
  ..nameApprovalAtasan = json['nameApprovalAtasan'] as String
  ..statusApprovalAdmin = json['statusApprovalAdmin'] as String
  ..statusApprovalHR = json['statusApprovalHR'] as String
  ..statusApprovalAtasan = json['statusApprovalAtasan'] as String
  ..dateApprovalAdmin = json['dateApprovalAdmin'] as String
  ..dateApprovalHR = json['dateApprovalHR'] as String
  ..dateApprovalAtasan = json['dateApprovalAtasan'] as String;

Map<String, dynamic> _$LeaveModelToJson(LeaveModel instance) =>
    <String, dynamic>{
      'leaveId': instance.leaveId,
      'userId': instance.userId,
      'leaveDateSubmitted': instance.leaveDateSubmitted,
      'leaveStartDate': instance.leaveStartDate,
      'leaveEndDate': instance.leaveEndDate,
      'leaveType': instance.leaveType,
      'leaveDescription': instance.leaveDescription,
      'leaveAttachment': instance.leaveAttachment,
      'leaveStatus': instance.leaveStatus,
      'nameApprovalAdmin': instance.nameApprovalAdmin,
      'nameApprovalHR': instance.nameApprovalHR,
      'nameApprovalAtasan': instance.nameApprovalAtasan,
      'statusApprovalAdmin': instance.statusApprovalAdmin,
      'statusApprovalHR': instance.statusApprovalHR,
      'statusApprovalAtasan': instance.statusApprovalAtasan,
      'dateApprovalAdmin': instance.dateApprovalAdmin,
      'dateApprovalHR': instance.dateApprovalHR,
      'dateApprovalAtasan': instance.dateApprovalAtasan,
    };
