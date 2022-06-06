// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AfterOvertimeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfterOvertimeModel _$AfterOvertimeModelFromJson(Map<String, dynamic> json) =>
    AfterOvertimeModel()
      ..afterOvertimeDateSubmitted =
          json['afterOvertimeDateSubmitted'] as String
      ..afterOvertimeTimeSubmitted =
          json['afterOvertimeTimeSubmitted'] as String
      ..afterOvertimeDate = json['afterOvertimeDate'] as String
      ..afterOvertimeStartTime = json['afterOvertimeStartTime'] as String
      ..afterOvertimeEndTime = json['afterOvertimeEndTime'] as String
      ..afterOvertimeDescription = json['afterOvertimeDescription'] as String
      ..afterOvertimeAttachment = json['afterOvertimeAttachment'] as String
      ..afterOvertimeStatus = json['afterOvertimeStatus'] as String;

Map<String, dynamic> _$AfterOvertimeModelToJson(AfterOvertimeModel instance) =>
    <String, dynamic>{
      'afterOvertimeDateSubmitted': instance.afterOvertimeDateSubmitted,
      'afterOvertimeTimeSubmitted': instance.afterOvertimeTimeSubmitted,
      'afterOvertimeDate': instance.afterOvertimeDate,
      'afterOvertimeStartTime': instance.afterOvertimeStartTime,
      'afterOvertimeEndTime': instance.afterOvertimeEndTime,
      'afterOvertimeDescription': instance.afterOvertimeDescription,
      'afterOvertimeAttachment': instance.afterOvertimeAttachment,
      'afterOvertimeStatus': instance.afterOvertimeStatus,
    };
