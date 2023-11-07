import 'package:intl/intl.dart';

class Userinfo {
  String? _name;
  String? _hireYear;
  String? _jobTitle;
  int? _totalExperienceYears;
  int? _remainingExperienceYears;

  String formattedDate = DateFormat('yyyy.MM.dd').format(DateTime.now());

  Userinfo(
      {String? name,
      String? hireYear,
      String? jobTitle,
      int? totalExperienceYears,
      int? remainingExperienceYears}) {
    if (name != null) {
      this._name = name;
    }
    if (hireYear != null) {
      this._hireYear = hireYear;
    }
    if (jobTitle != null) {
      this._jobTitle = jobTitle;
    }
    if (totalExperienceYears != null) {
      this._totalExperienceYears = totalExperienceYears;
    }
    if (remainingExperienceYears != null) {
      this._remainingExperienceYears = remainingExperienceYears;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get hireYear =>
      DateFormat('yyyy.MM.dd').format(DateTime.parse(_hireYear!));
  // DateTime? get hireYear => _hireYear;
  set hireYear(String? hireYear) => _hireYear = hireYear;
  String? get jobTitle => _jobTitle;
  set jobTitle(String? jobTitle) => _jobTitle = jobTitle;
  int? get totalExperienceYears => _totalExperienceYears;
  set totalExperienceYears(int? totalExperienceYears) =>
      _totalExperienceYears = totalExperienceYears;
  int? get remainingExperienceYears => _remainingExperienceYears;
  set remainingExperienceYears(int? remainingExperienceYears) =>
      _remainingExperienceYears = remainingExperienceYears;

  Userinfo.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _hireYear = json['hire_year'];
    _jobTitle = json['job_title'];
    _totalExperienceYears = json['total_experience_years'];
    _remainingExperienceYears = json['remaining_experience_years'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['hire_year'] = this._hireYear;
    data['job_title'] = this._jobTitle;
    data['total_experience_years'] = this._totalExperienceYears;
    data['remaining_experience_years'] = this._remainingExperienceYears;
    return data;
  }
}
