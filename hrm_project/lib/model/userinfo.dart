import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'userinfo.g.dart';

@JsonSerializable()
class Userinfo {
  String? _name;
  String? _hireYear;
  String? _jobTitle;
  int? _leavedays;
  int? _leavehours;
  int? _leaveminuts;

  String formattedDate = DateFormat('yyyy.MM.dd').format(DateTime.now());

  Userinfo(
      {String? name,
      String? hireYear,
      String? jobTitle,
      int? leavedays,
      int? leaveminuts,
      int? leavehours}) {
    if (name != null) {
      this._name = name;
    }
    if (hireYear != null) {
      this._hireYear = hireYear;
    }
    if (jobTitle != null) {
      this._jobTitle = jobTitle;
    }
    if (leavedays != null) {
      this._leavedays = leavedays;
    }
    if (leavehours != null) {
      this._leavehours = leavehours;
    }
    if (leaveminuts != null) {
      this._leaveminuts = leaveminuts;
    }
  }
  factory Userinfo.fromJson(Map<String, dynamic> json) =>
      _$UserinfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserinfoToJson(this);
}
