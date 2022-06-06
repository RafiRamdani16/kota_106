// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PermitHistoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermitHistoryModel _$PermitHistoryModelFromJson(Map<String, dynamic> json) =>
    PermitHistoryModel()
      ..totalData = json['totalData'] as int
      ..totalPage = json['totalPage'] as int
      ..pageSize = json['pageSize'] as int
      ..currentPage = json['currentPage'] as int
      ..data = (json['data'] as List<dynamic>)
          .map((e) => PermitModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PermitHistoryModelToJson(PermitHistoryModel instance) =>
    <String, dynamic>{
      'totalData': instance.totalData,
      'totalPage': instance.totalPage,
      'pageSize': instance.pageSize,
      'currentPage': instance.currentPage,
      'data': instance.data,
    };
