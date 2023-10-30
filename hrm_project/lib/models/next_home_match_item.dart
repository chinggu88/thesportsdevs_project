import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'next_home_match_item.g.dart';

@JsonSerializable()
class NextHomeMatchList {
  NextHomeMatchList({this.data});
  List<NextHomeMatchItem>? data;

  factory NextHomeMatchList.fromJson(Map<String, dynamic> json) =>
      _$NextHomeMatchListFromJson(json);

  Map<String, dynamic> toJson() => _$NextHomeMatchListToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 2)
class NextHomeMatchItem {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? meet_year;
  @HiveField(2)
  int? meet_seq;
  @HiveField(3)
  String? meet_name;
  @HiveField(4)
  int? game_id;
  @HiveField(5)
  String? game_date;
  @HiveField(6)
  String? yoil;
  @HiveField(7)
  String? game_time;
  @HiveField(8)
  String? home_team;
  @HiveField(9)
  String? home_team_name;
  @HiveField(10)
  String? away_team;
  @HiveField(11)
  String? away_team_name;
  @HiveField(12)
  int? field_id;
  @HiveField(13)
  String? field_name;

  NextHomeMatchItem({
    this.id,
    this.meet_year,
    this.meet_seq,
    this.meet_name,
    this.game_id,
    this.game_date,
    this.yoil,
    this.game_time,
    this.home_team,
    this.home_team_name,
    this.away_team,
    this.away_team_name,
    this.field_id,
    this.field_name,
  });

  factory NextHomeMatchItem.fromJson(Map<String, dynamic> json) =>
      _$NextHomeMatchItemFromJson(json);

  Map<String, dynamic> toJson() => _$NextHomeMatchItemToJson(this);
}
