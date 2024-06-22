// To parse this JSON data, do
//
//     final passportProcessStepModel = passportProcessStepModelFromJson(jsonString);

import 'dart:convert';

PassportProcessStepModel passportProcessStepModelFromJson(String str) => PassportProcessStepModel.fromJson(json.decode(str));

String passportProcessStepModelToJson(PassportProcessStepModel data) => json.encode(data.toJson());

class PassportProcessStepModel {
  Map<String, String>? candidate;
  List<ProcessList>? processList;
  List<ProcessRecord>? processRecord;

  PassportProcessStepModel({
    this.candidate,
    this.processList,
    this.processRecord,
  });

  factory PassportProcessStepModel.fromJson(Map<String, dynamic> json) => PassportProcessStepModel(
    candidate: Map.from(json["candidate"]).map((k, v) => MapEntry<String, String>(k, v)),
    processList: List<ProcessList>.from(json["process_list"].map((x) => ProcessList.fromJson(x))),
    processRecord: List<ProcessRecord>.from(json["process_record"].map((x) => ProcessRecord.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "candidate": Map.from(candidate!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "process_list": List<dynamic>.from(processList!.map((x) => x.toJson())),
    "process_record": List<dynamic>.from(processRecord!.map((x) => x.toJson())),
  };
}

class ProcessList {
  String id;
  String processName;

  ProcessList({
    required this.id,
    required this.processName,
  });

  factory ProcessList.fromJson(Map<String, dynamic> json) => ProcessList(
    id: json["id"],
    processName: json["process_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "process_name": processName,
  };
}

class ProcessRecord {
  String? id;
  String? candidateId;
  String? candidateName;
  String? candidateType;
  String? stepId;
  String? stepName;
  DateTime? data;

  ProcessRecord({
    this.id,
    this.candidateId,
    this.candidateName,
    this.candidateType,
    this.stepId,
    this.stepName,
    this.data,
  });

  factory ProcessRecord.fromJson(Map<String, dynamic> json) => ProcessRecord(
    id: json["id"],
    candidateId: json["candidate_id"],
    candidateName: json["candidate_name"],
    candidateType: json["candidate_type"],
    stepId: json["step_id"],
    stepName: json["step_name"],
    data: DateTime.parse(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "candidate_id": candidateId,
    "candidate_name": candidateName,
    "candidate_type": candidateType,
    "step_id": stepId,
    "step_name": stepName,
    "data": "${data?.year.toString().padLeft(4, '0')}-${data?.month.toString().padLeft(2, '0')}-${data?.day.toString().padLeft(2, '0')}",
  };
}
