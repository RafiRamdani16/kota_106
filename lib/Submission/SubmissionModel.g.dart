// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SubmissionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmissionModel _$SubmissionModelFromJson(Map<String, dynamic> json) =>
    SubmissionModel()
      ..submissionId = json['submissionId'] as int
      ..userId = json['userId'] as int
      ..dateSubmit = json['dateSubmit'] as String
      ..datePerform = json['datePerform'] as String
      ..startTime = json['startTime'] as String
      ..endTime = json['endTime'] as String
      ..submissionType = json['submissionType'] as String
      ..description = json['description'] as String
      ..attachment = json['attachment'] as String
      ..statusSubmission = json['statusSubmission'] as String
      ..historyApprovals = (json['historyApprovals'] as List<dynamic>)
          .map((e) => HistoryApprovalModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SubmissionModelToJson(SubmissionModel instance) =>
    <String, dynamic>{
      'submissionId': instance.submissionId,
      'userId': instance.userId,
      'dateSubmit': instance.dateSubmit,
      'datePerform': instance.datePerform,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'submissionType': instance.submissionType,
      'description': instance.description,
      'attachment': instance.attachment,
      'statusSubmission': instance.statusSubmission,
      'historyApprovals': instance.historyApprovals,
    };
