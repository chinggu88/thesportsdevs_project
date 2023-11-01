// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playerinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerInfoList _$PlayerInfoListFromJson(Map<String, dynamic> json) =>
    PlayerInfoList(
      itemList: (json['itemList'] as List<dynamic>?)
          ?.map((e) => PlayerInfoList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayerInfoListToJson(PlayerInfoList instance) =>
    <String, dynamic>{
      'itemList': instance.itemList,
    };

PlayerInfo _$PlayerInfoFromJson(Map<String, dynamic> json) => PlayerInfo(
      bACKNUM: json['BACKNUM'] as String?,
      nAME: json['NAME'] as String?,
      pLAYERIMG: json['PLAYERIMG'] as String?,
      pOSITION: json['POSITION'] as String?,
      pOSITION2: json['POSITION2'] as String?,
      hITTYPE: json['HITTYPE'] as String?,
      eNTRY: json['ENTRY'] as String?,
    );

Map<String, dynamic> _$PlayerInfoToJson(PlayerInfo instance) =>
    <String, dynamic>{
      'bACKNUM': instance.bACKNUM,
      'nAME': instance.nAME,
      'pLAYERIMG': instance.pLAYERIMG,
      'pOSITION': instance.pOSITION,
      'pOSITION2': instance.pOSITION2,
      'hITTYPE': instance.hITTYPE,
      'eNTRY': instance.eNTRY,
    };
