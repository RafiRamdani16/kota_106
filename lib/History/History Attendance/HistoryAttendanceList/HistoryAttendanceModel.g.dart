// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HistoryAttendanceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryAttendanceModel _$HistoryAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    HistoryAttendanceModel()
      ..totalData = json['totalData'] as int
      ..totalPage = json['totalPage'] as int
      ..pageSize = json['pageSize'] as int
      ..currentPage = json['currentPage'] as int
      ..data = (json['data'] as List<dynamic>)
          .map((e) => AttendanceModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$HistoryAttendanceModelToJson(
        HistoryAttendanceModel instance) =>
    <String, dynamic>{
      'totalData': instance.totalData,
      'totalPage': instance.totalPage,
      'pageSize': instance.pageSize,
      'currentPage': instance.currentPage,
      'data': instance.data,
    };
