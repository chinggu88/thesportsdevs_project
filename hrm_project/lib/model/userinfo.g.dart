// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Userinfo _$UserinfoFromJson(Map<String, dynamic> json) => Userinfo(
      name: json['name'] as String?,
      hireYear: json['hireYear'] as String?,
      jobTitle: json['jobTitle'] as String?,
      leaveminuts: json['leaveminuts'] as int?,
    );

Map<String, dynamic> _$UserinfoToJson(Userinfo instance) => <String, dynamic>{
      'name': instance.name,
      'hireYear': instance.hireYear,
      'jobTitle': instance.jobTitle,
      'leaveminuts': instance.leaveminuts,
    };
