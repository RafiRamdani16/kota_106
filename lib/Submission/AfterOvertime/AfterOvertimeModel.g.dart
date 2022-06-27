// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AfterOvertimeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfterOvertimeModel _$AfterOvertimeModelFromJson(Map<String, dynamic> json) =>
    AfterOvertimeModel()
      ..afterOvertimeid = json['afterOvertimeid'] as int
      ..overtimeId = json['overtimeId'] as int
      ..afterOvertimeDateSubmitted =
          json['afterOvertimeDateSubmitted'] as String
      ..afterOvertimeDate = json['afterOvertimeDate'] as String
      ..afterOvertimeStartTime = json['afterOvertimeStartTime'] as String
      ..afterOvertimeEndTime = json['afterOvertimeEndTime'] as String
      ..afterOvertimeDescription = json['afterOvertimeDescription'] as String
      ..afterOvertimeAttachment = json['afterOvertimeAttachment'] as String
      ..afterOvertimeStatus = json['afterOvertimeStatus'] as String
      ..historyApprovals = (json['historyApprovals'] as List<dynamic>)
          .map((e) => HistoryApprovalModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AfterOvertimeModelToJson(AfterOvertimeModel instance) =>
    <String, dynamic>{
      'afterOvertimeid': instance.afterOvertimeid,
      'overtimeId': instance.overtimeId,
      'afterOvertimeDateSubmitted': instance.afterOvertimeDateSubmitted,
      'afterOvertimeDate': instance.afterOvertimeDate,
      'afterOvertimeStartTime': instance.afterOvertimeStartTime,
      'afterOvertimeEndTime': instance.afterOvertimeEndTime,
      'afterOvertimeDescription': instance.afterOvertimeDescription,
      'afterOvertimeAttachment': instance.afterOvertimeAttachment,
      'afterOvertimeStatus': instance.afterOvertimeStatus,
      'historyApprovals': instance.historyApprovals,
    };
