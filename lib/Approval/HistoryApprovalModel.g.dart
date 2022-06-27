// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HistoryApprovalModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryApprovalModel _$HistoryApprovalModelFromJson(
        Map<String, dynamic> json) =>
    HistoryApprovalModel()
      ..approvalId = json['approvalId'] as int
      ..userId = json['userId'] as int
      ..userName = json['userName'] as String
      ..statusApproval = json['statusApproval'] as String
      ..dateApproval = json['dateApproval'] as String;

Map<String, dynamic> _$HistoryApprovalModelToJson(
        HistoryApprovalModel instance) =>
    <String, dynamic>{
      'approvalId': instance.approvalId,
      'userId': instance.userId,
      'userName': instance.userName,
      'statusApproval': instance.statusApproval,
      'dateApproval': instance.dateApproval,
    };
