// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaveApprovalModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveApprovalModel _$LeaveApprovalModelFromJson(Map<String, dynamic> json) =>
    LeaveApprovalModel()
      ..submissionLeaveId = json['submissionLeaveId'] as int
      ..submissionAttributeId = json['submissionAttributeId'] as int
      ..approvalId = json['approvalId'] as int
      ..userName = json['userName'] as String
      ..position = json['position'] as String
      ..dateSubmit = json['dateSubmit'] as String
      ..dateStart = json['dateStart'] as String
      ..dateEnd = json['dateEnd'] as String
      ..type = json['type'] as String
      ..description = json['description'] as String
      ..attachment = json['attachment'] as String
      ..statusLeave = json['statusLeave'] as String
      ..userIdApproval = json['userIdApproval'] as int
      ..statusApproval = json['statusApproval'] as String
      ..dateApproval = json['dateApproval'] as String;

Map<String, dynamic> _$LeaveApprovalModelToJson(LeaveApprovalModel instance) =>
    <String, dynamic>{
      'submissionLeaveId': instance.submissionLeaveId,
      'submissionAttributeId': instance.submissionAttributeId,
      'approvalId': instance.approvalId,
      'userName': instance.userName,
      'position': instance.position,
      'dateSubmit': instance.dateSubmit,
      'dateStart': instance.dateStart,
      'dateEnd': instance.dateEnd,
      'type': instance.type,
      'description': instance.description,
      'attachment': instance.attachment,
      'statusLeave': instance.statusLeave,
      'userIdApproval': instance.userIdApproval,
      'statusApproval': instance.statusApproval,
      'dateApproval': instance.dateApproval,
    };
