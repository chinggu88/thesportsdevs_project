import 'package:json_annotation/json_annotation.dart';

part 'playerinfo.g.dart';

@JsonSerializable()
class PlayerInfoList {
  PlayerInfoList({this.itemList});
  List<PlayerInfoList>? itemList;

  factory PlayerInfoList.fromJson(Map<String, dynamic> json) =>
      _$PlayerInfoListFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerInfoListToJson(this);
}

@JsonSerializable()
class PlayerInfo {
  String? bACKNUM;
  String? nAME;
  String? pLAYERIMG;
  String? pOSITION;
  String? pOSITION2;
  String? hITTYPE;
  String? eNTRY;

  PlayerInfo(
      {this.bACKNUM,
      this.nAME,
      this.pLAYERIMG,
      this.pOSITION,
      this.pOSITION2,
      this.hITTYPE,
      this.eNTRY});

  factory PlayerInfo.fromJson(Map<String, dynamic> json) =>
      _$PlayerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerInfoToJson(this);
}
