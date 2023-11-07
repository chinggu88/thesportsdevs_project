class Vacation {
  String? _name;
  String? _vacationType;
  String? _startTime;
  String? _endTime;
  String? _approval;

  Vacation(
      {String? name,
      String? vacationType,
      String? startTime,
      String? endTime,
      String? approval}) {
    if (name != null) {
      this._name = name;
    }
    if (vacationType != null) {
      this._vacationType = vacationType;
    }
    if (startTime != null) {
      this._startTime = startTime;
    }
    if (endTime != null) {
      this._endTime = endTime;
    }
    if (approval != null) {
      this._approval = approval;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get vacationType => _vacationType;
  set vacationType(String? vacationType) => _vacationType = vacationType;
  String? get startTime => _startTime;
  set startTime(String? startTime) => _startTime = startTime;
  String? get endTime => _endTime;
  set endTime(String? endTime) => _endTime = endTime;
  String? get approval => _approval;
  set approval(String? approval) => _approval = approval;

  Vacation.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _vacationType = json['vacation_type'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _approval = json['approval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['vacation_type'] = this._vacationType;
    data['start_time'] = this._startTime;
    data['end_time'] = this._endTime;
    data['approval'] = this._approval;
    return data;
  }
}
