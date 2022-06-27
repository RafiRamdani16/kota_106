// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApprovalModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApprovalModel _$ApprovalModelFromJson(Map<String, dynamic> json) =>
    ApprovalModel()
      ..submissionId = json['submissionId'] as int
      ..submissionAttributeId = json['submissionAttributeId'] as int
      ..approvalId = json['approvalId'] as int
      ..overtimeId = json['overtimeId'] as int
      ..userName = json['userName'] as String
      ..position = json['position'] as String
      ..dateSubmit = json['dateSubmit'] as String
      ..datePerform = json['datePerform'] as String
      ..endTime = json['endTime'] as String
      ..startTime = json['startTime'] as String
      ..submissionType = json['submissionType'] as String
      ..description = json['description'] as String
      ..attachment = json['attachment'] as String
      ..statusSubmission = json['statusSubmission'] as String
      ..userIdApproval = json['userIdApproval'] as int
      ..statusApproval = json['statusApproval'] as String
      ..dateApproval = json['dateApproval'] as String;

Map<String, dynamic> _$ApprovalModelToJson(ApprovalModel instance) =>
    <String, dynamic>{
      'submissionId': instance.submissionId,
      'submissionAttributeId': instance.submissionAttributeId,
      'approvalId': instance.approvalId,
      'overtimeId': instance.overtimeId,
      'userName': instance.userName,
      'position': instance.position,
      'dateSubmit': instance.dateSubmit,
      'datePerform': instance.datePerform,
      'endTime': instance.endTime,
      'startTime': instance.startTime,
      'submissionType': instance.submissionType,
      'description': instance.description,
      'attachment': instance.attachment,
      'statusSubmission': instance.statusSubmission,
      'userIdApproval': instance.userIdApproval,
      'statusApproval': instance.statusApproval,
      'dateApproval': instance.dateApproval,
    };
