// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vacation _$VacationFromJson(Map<String, dynamic> json) => Vacation(
      name: json['name'] as String?,
      vacationType: json['vacationType'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      approval: json['approval'] as String?,
    )
      ..approve = json['approve'] as bool?
      ..insertdate = json['insertdate'] as String?
      ..startDay = json['startDay'] as String?
      ..endDay = json['endDay'] as String?;

Map<String, dynamic> _$VacationToJson(Vacation instance) => <String, dynamic>{
      'name': instance.name,
      'vacationType': instance.vacationType,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'approval': instance.approval,
      'approve': instance.approve,
      'insertdate': instance.insertdate,
      'startDay': instance.startDay,
      'endDay': instance.endDay,
    };
