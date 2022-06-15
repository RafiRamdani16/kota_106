// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OvertimeApprovalModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OvertimeApprovalModel _$OvertimeApprovalModelFromJson(
        Map<String, dynamic> json) =>
    OvertimeApprovalModel()
      ..overtimeId = json['overtimeId'] as int
      ..userId = json['userId'] as int
      ..afterOvertimeId = json['afterOvertimeId'] as int
      ..userName = json['userName'] as String
      ..position = json['position'] as String
      ..overtimeDateSubmitted = json['overtimeDateSubmitted'] as String
      ..overtimeTimeSubmitted = json['overtimeTimeSubmitted'] as String
      ..overtimeDate = json['overtimeDate'] as String
      ..overtimeStartTime = json['overtimeStartTime'] as String
      ..overtimeEndTime = json['overtimeEndTime'] as String
      ..overtimeDescription = json['overtimeDescription'] as String
      ..overtimeAttachment = json['overtimeAttachment'] as String
      ..overtimeStatus = json['overtimeStatus'] as String
      ..idApprovalAdmin = json['idApprovalAdmin'] as int
      ..idApprovalHR = json['idApprovalHR'] as int
      ..idApprovalAtasan = json['idApprovalAtasan'] as int
      ..statusApprovalAdmin = json['statusApprovalAdmin'] as String
      ..statusApprovalHR = json['statusApprovalHR'] as String
      ..statusApprovalAtasan = json['statusApprovalAtasan'] as String
      ..dateApprovalAdmin = json['dateApprovalAdmin'] as String
      ..dateApprovalHR = json['dateApprovalHR'] as String
      ..dateApprovalAtasan = json['dateApprovalAtasan'] as String;

Map<String, dynamic> _$OvertimeApprovalModelToJson(
        OvertimeApprovalModel instance) =>
    <String, dynamic>{
      'overtimeId': instance.overtimeId,
      'userId': instance.userId,
      'afterOvertimeId': instance.afterOvertimeId,
      'userName': instance.userName,
      'position': instance.position,
      'overtimeDateSubmitted': instance.overtimeDateSubmitted,
      'overtimeTimeSubmitted': instance.overtimeTimeSubmitted,
      'overtimeDate': instance.overtimeDate,
      'overtimeStartTime': instance.overtimeStartTime,
      'overtimeEndTime': instance.overtimeEndTime,
      'overtimeDescription': instance.overtimeDescription,
      'overtimeAttachment': instance.overtimeAttachment,
      'overtimeStatus': instance.overtimeStatus,
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
