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
      bACKNUM: json['bACKNUM'] as String?,
      nAME: json['nAME'] as String?,
      pLAYERIMG: json['pLAYERIMG'] as String?,
      pOSITION: json['pOSITION'] as String?,
      pOSITION2: json['pOSITION2'] as String?,
      hITTYPE: json['hITTYPE'] as String?,
      eNTRY: json['eNTRY'] as String?,
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
