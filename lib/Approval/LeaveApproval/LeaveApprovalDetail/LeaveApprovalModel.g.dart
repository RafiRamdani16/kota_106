// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaveApprovalModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveApprovalModel _$LeaveApprovalModelFromJson(Map<String, dynamic> json) =>
    LeaveApprovalModel()
      ..leaveId = json['leaveId'] as int
      ..userId = json['userId'] as int
      ..userName = json['userName'] as String
      ..position = json['position'] as String
      ..leaveRemainingDays = json['leaveRemainingDays'] as String
      ..leaveType = json['leaveType'] as String
      ..leaveTimeSubmitted = json['leaveTimeSubmitted'] as String
      ..leaveDateSubmitted = json['leaveDateSubmitted'] as String
      ..leaveStartDate = json['leaveStartDate'] as String
      ..leaveEndDate = json['leaveEndDate'] as String
      ..leaveDescription = json['leaveDescription'] as String
      ..leaveAttachment = json['leaveAttachment'] as String
      ..leaveStatus = json['leaveStatus'] as String
      ..idApprovalAdmin = json['idApprovalAdmin'] as int
      ..idApprovalHR = json['idApprovalHR'] as int
      ..idApprovalAtasan = json['idApprovalAtasan'] as int
      ..statusApprovalAdmin = json['statusApprovalAdmin'] as String
      ..statusApprovalHR = json['statusApprovalHR'] as String
      ..statusApprovalAtasan = json['statusApprovalAtasan'] as String
      ..dateApprovalAdmin = json['dateApprovalAdmin'] as String
      ..dateApprovalHR = json['dateApprovalHR'] as String
      ..dateApprovalAtasan = json['dateApprovalAtasan'] as String;

Map<String, dynamic> _$LeaveApprovalModelToJson(LeaveApprovalModel instance) =>
    <String, dynamic>{
      'leaveId': instance.leaveId,
      'userId': instance.userId,
      'userName': instance.userName,
      'position': instance.position,
      'leaveRemainingDays': instance.leaveRemainingDays,
      'leaveType': instance.leaveType,
      'leaveTimeSubmitted': instance.leaveTimeSubmitted,
      'leaveDateSubmitted': instance.leaveDateSubmitted,
      'leaveStartDate': instance.leaveStartDate,
      'leaveEndDate': instance.leaveEndDate,
      'leaveDescription': instance.leaveDescription,
      'leaveAttachment': instance.leaveAttachment,
      'leaveStatus': instance.leaveStatus,
      'idApprovalAdmin': instance.idApprovalAdmin,
      'idApprovalHR': instance.idApprovalHR,
      'idApprovalAtasan': instance.idApprovalAtasan,
      'statusApprovalAdmin': instance.statusApprovalAdmin,
      'statusApprovalHR': instance.statusApprovalHR,
      'statusApprovalAtasan': instance.statusApprovalAtasan,
      'dateApprovalAdmin': instance.dateApprovalAdmin,
      'dateApprovalHR': instance.dateApprovalHR,
      'dateApprovalAtasan': instance.dateApprovalAtasan,
    };
