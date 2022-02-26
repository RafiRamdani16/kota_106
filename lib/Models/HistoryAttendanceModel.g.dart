// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HistoryAttendanceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryAttendanceModel _$HistoryAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    HistoryAttendanceModel()
      ..checkInTime = json['checkInTime'] as String
      ..checkOutTime = json['checkOutTime'] as String
      ..checkInLocation = json['checkInLocation'] as String
      ..checkOutLocation = json['checkOutLocation'] as String
      ..checkInPhotoName = json['checkInPhotoName'] as String
      ..checkInDate = json['checkInDate'] as String
      ..checkOutDate = json['checkOutDate'] as String
      ..doneList = json['doneList'] as String;

Map<String, dynamic> _$HistoryAttendanceModelToJson(
        HistoryAttendanceModel instance) =>
    <String, dynamic>{
      'checkInTime': instance.checkInTime,
      'checkOutTime': instance.checkOutTime,
      'checkInLocation': instance.checkInLocation,
      'checkOutLocation': instance.checkOutLocation,
      'checkInPhotoName': instance.checkInPhotoName,
      'checkInDate': instance.checkInDate,
      'checkOutDate': instance.checkOutDate,
      'doneList': instance.doneList,
    };
