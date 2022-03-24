// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HistoryActivityRecordModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryActivityRecordModel _$HistoryActivityRecordModelFromJson(
        Map<String, dynamic> json) =>
    HistoryActivityRecordModel()
      ..totalData = json['totalData'] as int
      ..totalPage = json['totalPage'] as int
      ..pageSize = json['pageSize'] as int
      ..currentPage = json['currentPage'] as int
      ..data = (json['data'] as List<dynamic>)
          .map((e) => ActivityRecordModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$HistoryActivityRecordModelToJson(
        HistoryActivityRecordModel instance) =>
    <String, dynamic>{
      'totalData': instance.totalData,
      'totalPage': instance.totalPage,
      'pageSize': instance.pageSize,
      'currentPage': instance.currentPage,
      'data': instance.data,
    };
