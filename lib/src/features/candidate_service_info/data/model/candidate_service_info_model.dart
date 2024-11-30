// To parse this JSON data, do
//
//     final candidateServiceInfoModel = candidateServiceInfoModelFromJson(jsonString);

import 'dart:convert';

CandidateServiceInfoModel candidateServiceInfoModelFromJson(String str) => CandidateServiceInfoModel.fromJson(json.decode(str));

String candidateServiceInfoModelToJson(CandidateServiceInfoModel data) => json.encode(data.toJson());

class CandidateServiceInfoModel {
  int? totalServices;
  List<ServiceInfo>? serviceInfo;
  List<PassportRenew>? passportRenew;

  CandidateServiceInfoModel({
    this.totalServices,
    this.serviceInfo,
    this.passportRenew,
  });

  factory CandidateServiceInfoModel.fromJson(Map<String, dynamic> json) => CandidateServiceInfoModel(
    totalServices: json["total_services"],
    serviceInfo: List<ServiceInfo>.from(json["service_info"].map((x) => ServiceInfo.fromJson(x))),
    passportRenew: List<PassportRenew>.from(json["passport_renew"].map((x) => PassportRenew.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_services": totalServices,
    "service_info": List<dynamic>.from(serviceInfo!.map((x) => x.toJson())),
    "passport_renew": List<dynamic>.from(passportRenew!.map((x) => x.toJson())),
  };
}

class PassportRenew {
  String id;
  String candidateId;
  String oldPassportType;
  String oldPassportNumber;
  DateTime oldPassportIssueDate;
  String oldPassportIssuePlace;
  String oldPassportIssuePlaceName;
  String oldValidityYear;
  String oldPassportScanCopy;
  String oldPassportNote;
  String newPassportType;
  String newPassportNumber;
  String newPassportIssueDate;
  String newPassportIssuePlace;
  String newPassportIssuePlaceName;
  String newValidityYear;
  String newPassportScanCopy;
  String newPassportNote;
  String status;
  String uploaderInfo;
  DateTime data;
  String dateFilter;

  PassportRenew({
    required this.id,
    required this.candidateId,
    required this.oldPassportType,
    required this.oldPassportNumber,
    required this.oldPassportIssueDate,
    required this.oldPassportIssuePlace,
    required this.oldPassportIssuePlaceName,
    required this.oldValidityYear,
    required this.oldPassportScanCopy,
    required this.oldPassportNote,
    required this.newPassportType,
    required this.newPassportNumber,
    required this.newPassportIssueDate,
    required this.newPassportIssuePlace,
    required this.newPassportIssuePlaceName,
    required this.newValidityYear,
    required this.newPassportScanCopy,
    required this.newPassportNote,
    required this.status,
    required this.uploaderInfo,
    required this.data,
    required this.dateFilter,
  });

  factory PassportRenew.fromJson(Map<String, dynamic> json) => PassportRenew(
    id: json["id"],
    candidateId: json["candidate_id"],
    oldPassportType: json["old_passport_type"],
    oldPassportNumber: json["old_passport_number"],
    oldPassportIssueDate: DateTime.parse(json["old_passport_issue_date"]),
    oldPassportIssuePlace: json["old_passport_issue_place"],
    oldPassportIssuePlaceName: json["old_passport_issue_place_name"],
    oldValidityYear: json["old_validity_year"],
    oldPassportScanCopy: json["old_passport_scan_copy"],
    oldPassportNote: json["old_passport_note"],
    newPassportType: json["new_passport_type"],
    newPassportNumber: json["new_passport_number"],
    newPassportIssueDate: json["new_passport_issue_date"],
    newPassportIssuePlace: json["new_passport_issue_place"],
    newPassportIssuePlaceName: json["new_passport_issue_place_name"],
    newValidityYear: json["new_validity_year"],
    newPassportScanCopy: json["new_passport_scan_copy"],
    newPassportNote: json["new_passport_note"],
    status: json["status"],
    uploaderInfo: json["uploader_info"],
    data: DateTime.parse(json["data"]),
    dateFilter: json["date_filter"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "candidate_id": candidateId,
    "old_passport_type": oldPassportType,
    "old_passport_number": oldPassportNumber,
    "old_passport_issue_date": "${oldPassportIssueDate.year.toString().padLeft(4, '0')}-${oldPassportIssueDate.month.toString().padLeft(2, '0')}-${oldPassportIssueDate.day.toString().padLeft(2, '0')}",
    "old_passport_issue_place": oldPassportIssuePlace,
    "old_passport_issue_place_name": oldPassportIssuePlaceName,
    "old_validity_year": oldValidityYear,
    "old_passport_scan_copy": oldPassportScanCopy,
    "old_passport_note": oldPassportNote,
    "new_passport_type": newPassportType,
    "new_passport_number": newPassportNumber,
    "new_passport_issue_date": newPassportIssueDate,
    "new_passport_issue_place": newPassportIssuePlace,
    "new_passport_issue_place_name": newPassportIssuePlaceName,
    "new_validity_year": newValidityYear,
    "new_passport_scan_copy": newPassportScanCopy,
    "new_passport_note": newPassportNote,
    "status": status,
    "uploader_info": uploaderInfo,
    "data": "${data.year.toString().padLeft(4, '0')}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}",
    "date_filter": dateFilter,
  };
}

class ServiceInfo {
  String serviceType;
  String country;
  String work;
  DateTime date;

  ServiceInfo({
    required this.serviceType,
    required this.country,
    required this.work,
    required this.date,
  });

  factory ServiceInfo.fromJson(Map<String, dynamic> json) => ServiceInfo(
    serviceType: json["service_type"],
    country: json["country"],
    work: json["work"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "service_type": serviceType,
    "country": country,
    "work": work,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
  };
}
