// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_home_match_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NextHomeMatchItemAdapter extends TypeAdapter<NextHomeMatchItem> {
  @override
  final int typeId = 2;

  @override
  NextHomeMatchItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NextHomeMatchItem(
      id: fields[0] as int?,
      meet_year: fields[1] as int?,
      meet_seq: fields[2] as int?,
      meet_name: fields[3] as String?,
      game_id: fields[4] as int?,
      game_date: fields[5] as String?,
      yoil: fields[6] as String?,
      game_time: fields[7] as String?,
      home_team: fields[8] as String?,
      home_team_name: fields[9] as String?,
      away_team: fields[10] as String?,
      away_team_name: fields[11] as String?,
      field_id: fields[12] as int?,
      field_name: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NextHomeMatchItem obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.meet_year)
      ..writeByte(2)
      ..write(obj.meet_seq)
      ..writeByte(3)
      ..write(obj.meet_name)
      ..writeByte(4)
      ..write(obj.game_id)
      ..writeByte(5)
      ..write(obj.game_date)
      ..writeByte(6)
      ..write(obj.yoil)
      ..writeByte(7)
      ..write(obj.game_time)
      ..writeByte(8)
      ..write(obj.home_team)
      ..writeByte(9)
      ..write(obj.home_team_name)
      ..writeByte(10)
      ..write(obj.away_team)
      ..writeByte(11)
      ..write(obj.away_team_name)
      ..writeByte(12)
      ..write(obj.field_id)
      ..writeByte(13)
      ..write(obj.field_name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NextHomeMatchItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextHomeMatchList _$NextHomeMatchListFromJson(Map<String, dynamic> json) =>
    NextHomeMatchList(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NextHomeMatchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NextHomeMatchListToJson(NextHomeMatchList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

NextHomeMatchItem _$NextHomeMatchItemFromJson(Map<String, dynamic> json) =>
    NextHomeMatchItem(
      id: json['id'] as int?,
      meet_year: json['meet_year'] as int?,
      meet_seq: json['meet_seq'] as int?,
      meet_name: json['meet_name'] as String?,
      game_id: json['game_id'] as int?,
      game_date: json['game_date'] as String?,
      yoil: json['yoil'] as String?,
      game_time: json['game_time'] as String?,
      home_team: json['home_team'] as String?,
      home_team_name: json['home_team_name'] as String?,
      away_team: json['away_team'] as String?,
      away_team_name: json['away_team_name'] as String?,
      field_id: json['field_id'] as int?,
      field_name: json['field_name'] as String?,
    );

Map<String, dynamic> _$NextHomeMatchItemToJson(NextHomeMatchItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meet_year': instance.meet_year,
      'meet_seq': instance.meet_seq,
      'meet_name': instance.meet_name,
      'game_id': instance.game_id,
      'game_date': instance.game_date,
      'yoil': instance.yoil,
      'game_time': instance.game_time,
      'home_team': instance.home_team,
      'home_team_name': instance.home_team_name,
      'away_team': instance.away_team,
      'away_team_name': instance.away_team_name,
      'field_id': instance.field_id,
      'field_name': instance.field_name,
    };
