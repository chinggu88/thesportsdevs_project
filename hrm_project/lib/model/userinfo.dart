import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'userinfo.g.dart';

@JsonSerializable()
class Userinfo {
  String? name;
  String? hireYear;
  String? jobTitle;
  int? leaveminuts;

  Userinfo({this.name, this.hireYear, this.jobTitle, this.leaveminuts});
  factory Userinfo.fromJson(Map<String, dynamic> json) =>
      _$UserinfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserinfoToJson(this);
}
