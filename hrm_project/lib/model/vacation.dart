import 'package:json_annotation/json_annotation.dart';

part 'vacation.g.dart';

@JsonSerializable()
class Vacation {
  String? name;
  String? vacationType;
  String? startTime;
  String? endTime;
  String? approval;
  bool? approve;
  String? insertdate;
  String? startDay;
  String? endDay;

  Vacation(
      {this.name,
      this.vacationType,
      this.startTime,
      this.endTime,
      this.approval});

  factory Vacation.fromJson(Map<String, dynamic> json) =>
      _$VacationFromJson(json);

  Map<String, dynamic> toJson() => _$VacationToJson(this);
}
