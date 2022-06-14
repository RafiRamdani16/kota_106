// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OvertimeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OvertimeModel _$OvertimeModelFromJson(Map<String, dynamic> json) =>
    OvertimeModel()
      ..overtimeId = json['overtimeId'] as int
      ..userId = json['userId'] as int
      ..overtimeDateSubmitted = json['overtimeDateSubmitted'] as String
      ..overtimeDate = json['overtimeDate'] as String
      ..overtimeStartTime = json['overtimeStartTime'] as String
      ..overtimeEndTime = json['overtimeEndTime'] as String
      ..overtimeDescription = json['overtimeDescription'] as String
      ..overtimeStatus = json['overtimeStatus'] as String
      ..nameApprovalAdmin = json['nameApprovalAdmin'] as String
      ..nameApprovalHR = json['nameApprovalHR'] as String
      ..nameApprovalAtasan = json['nameApprovalAtasan'] as String
      ..statusApprovalAdmin = json['statusApprovalAdmin'] as String
      ..statusApprovalHR = json['statusApprovalHR'] as String
      ..statusApprovalAtasan = json['statusApprovalAtasan'] as String
      ..dateApprovalAdmin = json['dateApprovalAdmin'] as String
      ..dateApprovalHR = json['dateApprovalHR'] as String
      ..dateApprovalAtasan = json['dateApprovalAtasan'] as String;

Map<String, dynamic> _$OvertimeModelToJson(OvertimeModel instance) =>
    <String, dynamic>{
      'overtimeId': instance.overtimeId,
      'userId': instance.userId,
      'overtimeDateSubmitted': instance.overtimeDateSubmitted,
      'overtimeDate': instance.overtimeDate,
      'overtimeStartTime': instance.overtimeStartTime,
      'overtimeEndTime': instance.overtimeEndTime,
      'overtimeDescription': instance.overtimeDescription,
      'overtimeStatus': instance.overtimeStatus,
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
