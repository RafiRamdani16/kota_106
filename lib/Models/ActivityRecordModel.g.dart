// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActivityRecordModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityRecordModel _$ActivityRecordModelFromJson(Map<String, dynamic> json) =>
    ActivityRecordModel()
      ..date = json['date'] as String
      ..time = json['time'] as String
      ..location = json['location'] as String
      ..description = json['description'] as String
      ..photoName = json['photoName'] as String;

Map<String, dynamic> _$ActivityRecordModelToJson(
        ActivityRecordModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'time': instance.time,
      'location': instance.location,
      'description': instance.description,
      'photoName': instance.photoName,
    };
