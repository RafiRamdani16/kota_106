// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OvertimeHistoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OvertimeHistoryModel _$OvertimeHistoryModelFromJson(
        Map<String, dynamic> json) =>
    OvertimeHistoryModel()
      ..totalData = json['totalData'] as int
      ..totalPage = json['totalPage'] as int
      ..pageSize = json['pageSize'] as int
      ..currentPage = json['currentPage'] as int
      ..data = (json['data'] as List<dynamic>)
          .map((e) => OvertimeModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$OvertimeHistoryModelToJson(
        OvertimeHistoryModel instance) =>
    <String, dynamic>{
      'totalData': instance.totalData,
      'totalPage': instance.totalPage,
      'pageSize': instance.pageSize,
      'currentPage': instance.currentPage,
      'data': instance.data,
    };
