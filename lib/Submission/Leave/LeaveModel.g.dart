// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LeaveModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveModel _$LeaveModelFromJson(Map<String, dynamic> json) => LeaveModel()
  ..submissionLeaveId = json['submissionLeaveId'] as int
  ..userId = json['userId'] as int
  ..dateSubmit = json['dateSubmit'] as String
  ..dateStart = json['dateStart'] as String
  ..dateEnd = json['dateEnd'] as String
  ..type = json['type'] as String
  ..description = json['description'] as String
  ..attachment = json['attachment'] as String
  ..statusLeave = json['statusLeave'] as String
  ..historyApprovals = (json['historyApprovals'] as List<dynamic>)
      .map((e) => HistoryApprovalModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$LeaveModelToJson(LeaveModel instance) =>
    <String, dynamic>{
      'submissionLeaveId': instance.submissionLeaveId,
      'userId': instance.userId,
      'dateSubmit': instance.dateSubmit,
      'dateStart': instance.dateStart,
      'dateEnd': instance.dateEnd,
      'type': instance.type,
      'description': instance.description,
      'attachment': instance.attachment,
      'statusLeave': instance.statusLeave,
      'historyApprovals': instance.historyApprovals,
    };
