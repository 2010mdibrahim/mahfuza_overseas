class EmployeeAttendanceModel {
  var status;
  var code;
  var message;
  var attandanceYear;
  var name;
  var employeeId;
  var department;
  var designation;
  var roasterCode;
  var roasterName;
  var dutyStartTime;
  var dutyEndTime;
  var roasterUpdateTime;
  var totalNumberOfDays;
  var totalNumberOfWeekend;
  var totalNumberOfHolyday;
  var totalNumberOfLeave;
  var totalNumberOfAbsent;
  var totalNumberOfPresent;
  List<Data>? data;

  EmployeeAttendanceModel(
      {this.status,
        this.code,
        this.message,
        this.attandanceYear,
        this.name,
        this.employeeId,
        this.department,
        this.designation,
        this.roasterCode,
        this.roasterName,
        this.dutyStartTime,
        this.dutyEndTime,
        this.roasterUpdateTime,
        this.totalNumberOfDays,
        this.totalNumberOfWeekend,
        this.totalNumberOfHolyday,
        this.totalNumberOfLeave,
        this.totalNumberOfAbsent,
        this.totalNumberOfPresent,
        this.data});

  EmployeeAttendanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    attandanceYear = json['attandance_year'];
    name = json['name'];
    employeeId = json['employee_id'];
    department = json['department'];
    designation = json['designation'];
    roasterCode = json['roaster_code'];
    roasterName = json['roaster_name'];
    dutyStartTime = json['duty_start_time'];
    dutyEndTime = json['duty_end_time'];
    roasterUpdateTime = json['roaster_update_time'];
    totalNumberOfDays = json['total_number_of_days'];
    totalNumberOfWeekend = json['total_number_of_weekend'];
    totalNumberOfHolyday = json['total_number_of_holyday'];
    totalNumberOfLeave = json['total_number_of_leave'];
    totalNumberOfAbsent = json['total_number_of_absent'];
    totalNumberOfPresent = json['total_number_of_present'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    data['attandance_year'] = this.attandanceYear;
    data['name'] = this.name;
    data['employee_id'] = this.employeeId;
    data['department'] = this.department;
    data['designation'] = this.designation;
    data['roaster_code'] = this.roasterCode;
    data['roaster_name'] = this.roasterName;
    data['duty_start_time'] = this.dutyStartTime;
    data['duty_end_time'] = this.dutyEndTime;
    data['roaster_update_time'] = this.roasterUpdateTime;
    data['total_number_of_days'] = this.totalNumberOfDays;
    data['total_number_of_weekend'] = this.totalNumberOfWeekend;
    data['total_number_of_holyday'] = this.totalNumberOfHolyday;
    data['total_number_of_leave'] = this.totalNumberOfLeave;
    data['total_number_of_absent'] = this.totalNumberOfAbsent;
    data['total_number_of_present'] = this.totalNumberOfPresent;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? month;
  String? yearMonth;
  int? numberOfDays;
  int? totalAbsent;
  int? totalLeave;
  int? totalWeekend;
  int? totalHolyday;
  int? totalPresent;
  List<AttandanceData>? attandanceData;

  Data(
      {this.month,
        this.yearMonth,
        this.numberOfDays,
        this.totalAbsent,
        this.totalLeave,
        this.totalWeekend,
        this.totalHolyday,
        this.totalPresent,
        this.attandanceData});

  Data.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    yearMonth = json['year_month'];
    numberOfDays = json['number_of_days'];
    totalAbsent = json['total_absent'];
    totalLeave = json['total_leave'];
    totalWeekend = json['total_weekend'];
    totalHolyday = json['total_holyday'];
    totalPresent = json['total_present'];
    if (json['attandance_data'] != null) {
      attandanceData = <AttandanceData>[];
      json['attandance_data'].forEach((v) {
        attandanceData!.add(new AttandanceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['year_month'] = this.yearMonth;
    data['number_of_days'] = this.numberOfDays;
    data['total_absent'] = this.totalAbsent;
    data['total_leave'] = this.totalLeave;
    data['total_weekend'] = this.totalWeekend;
    data['total_holyday'] = this.totalHolyday;
    data['total_present'] = this.totalPresent;
    if (this.attandanceData != null) {
      data['attandance_data'] =
          this.attandanceData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttandanceData {
  String? date;
  String? day;
  String? type;
  String? indicator;
  String? color;
  String? checkIn;
  String? checkOut;
  String? note;

  AttandanceData(
      {this.date,
        this.day,
        this.type,
        this.indicator,
        this.color,
        this.checkIn,
        this.checkOut,
        this.note});

  AttandanceData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'];
    type = json['type'];
    indicator = json['indicator'];
    color = json['color'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['day'] = this.day;
    data['type'] = this.type;
    data['indicator'] = this.indicator;
    data['color'] = this.color;
    data['check_in'] = this.checkIn;
    data['check_out'] = this.checkOut;
    data['note'] = this.note;
    return data;
  }
}
