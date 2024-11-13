class CandidateListModel {
  String? status;
  String? code;
  String? type;
  List<Data>? data;

  CandidateListModel({this.status, this.code, this.type, this.data});

  CandidateListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    type = json['type'];
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
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? candidateTypeId;
  String? candidateType;
  String? isTuriest;
  String? agentId;
  String? agentName;
  String? interestedCountryId;
  String? interestedCountryName;
  String? interestedJobId;
  String? interestedJobName;
  String? processCountryId;
  String? processCountryName;
  String? processJobId;
  String? processJobName;
  String? nationality;
  String? firstName;
  String? lastName;
  String? fullName;
  String? gender;
  String? dateOfBirth;
  String? email;
  String? phoneNumber;
  String? password;
  String? contactNumber;
  String? nidNumber;
  String? fatherName;
  String? motherName;
  String? spouseName;
  String? nomineeName;
  String? religion;
  String? maritalStatus;
  String? bloodGroup;
  String? nomineeRelation;
  String? note;
  String? experianceType;
  String? oldCompanyName;
  String? oldJobId;
  String? oldJobName;
  String? departureDate;
  String? arrivalDate;
  String? departureSeal;
  String? arrivalSeal;
  String? oldCompanyAddress;
  String? travelledCountryIds;
  String? passportType;
  String? passportNumber;
  String? oldPassportNumber;
  String? passportIssueDate;
  String? passportExpiredDate;
  String? passportIssuePlace;
  String? passportIssuePlaceName;
  String? validityYear;
  String? passportScanCopy;
  String? passportNote;
  String? countryId;
  String? countryName;
  String? divisionId;
  String? divisionName;
  String? districtId;
  String? districtName;
  String? thanaId;
  String? thanaName;
  String? postofficeId;
  String? postofficeName;
  String? postofficeCode;
  String? stateId;
  String? stateName;
  String? currentAddress;
  String? permanentAddress;
  String? candidatePhoto;
  String? policationVerificationFile;
  String? otherCertification;
  String? optionalFiles;
  String? comments;
  String? isChield;
  String? status;
  String? visaId;
  String? sponsorId;
  String? sponsorName;
  String? isStart;
  String? isCompletaed;
  String? runingStep;
  String? totalStep;
  String? isDublicate;
  String? terminatedNote;
  String? terminatedAttachment;
  String? uploaderInfo;
  String? data;
  String? dateFilter;

  Data(
      {this.id,
        this.candidateTypeId,
        this.candidateType,
        this.isTuriest,
        this.agentId,
        this.agentName,
        this.interestedCountryId,
        this.interestedCountryName,
        this.interestedJobId,
        this.interestedJobName,
        this.processCountryId,
        this.processCountryName,
        this.processJobId,
        this.processJobName,
        this.nationality,
        this.firstName,
        this.lastName,
        this.fullName,
        this.gender,
        this.dateOfBirth,
        this.email,
        this.phoneNumber,
        this.password,
        this.contactNumber,
        this.nidNumber,
        this.fatherName,
        this.motherName,
        this.spouseName,
        this.nomineeName,
        this.religion,
        this.maritalStatus,
        this.bloodGroup,
        this.nomineeRelation,
        this.note,
        this.experianceType,
        this.oldCompanyName,
        this.oldJobId,
        this.oldJobName,
        this.departureDate,
        this.arrivalDate,
        this.departureSeal,
        this.arrivalSeal,
        this.oldCompanyAddress,
        this.travelledCountryIds,
        this.passportType,
        this.passportNumber,
        this.oldPassportNumber,
        this.passportIssueDate,
        this.passportExpiredDate,
        this.passportIssuePlace,
        this.passportIssuePlaceName,
        this.validityYear,
        this.passportScanCopy,
        this.passportNote,
        this.countryId,
        this.countryName,
        this.divisionId,
        this.divisionName,
        this.districtId,
        this.districtName,
        this.thanaId,
        this.thanaName,
        this.postofficeId,
        this.postofficeName,
        this.postofficeCode,
        this.stateId,
        this.stateName,
        this.currentAddress,
        this.permanentAddress,
        this.candidatePhoto,
        this.policationVerificationFile,
        this.otherCertification,
        this.optionalFiles,
        this.comments,
        this.isChield,
        this.status,
        this.visaId,
        this.sponsorId,
        this.sponsorName,
        this.isStart,
        this.isCompletaed,
        this.runingStep,
        this.totalStep,
        this.isDublicate,
        this.terminatedNote,
        this.terminatedAttachment,
        this.uploaderInfo,
        this.data,
        this.dateFilter});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    candidateTypeId = json['candidate_type_id'];
    candidateType = json['candidate_type'];
    isTuriest = json['is_turiest'];
    agentId = json['agent_id'];
    agentName = json['agent_name'];
    interestedCountryId = json['interested_country_id'];
    interestedCountryName = json['interested_country_name'];
    interestedJobId = json['interested_job_id'];
    interestedJobName = json['interested_job_name'];
    processCountryId = json['process_country_id'];
    processCountryName = json['process_country_name'];
    processJobId = json['process_job_id'];
    processJobName = json['process_job_name'];
    nationality = json['nationality'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    contactNumber = json['contact_number'];
    nidNumber = json['nid_number'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    spouseName = json['spouse_name'];
    nomineeName = json['nominee_name'];
    religion = json['religion'];
    maritalStatus = json['marital_status'];
    bloodGroup = json['blood_group'];
    nomineeRelation = json['nominee_relation'];
    note = json['note'];
    experianceType = json['experiance_type'];
    oldCompanyName = json['old_company_name'];
    oldJobId = json['old_job_id'];
    oldJobName = json['old_job_name'];
    departureDate = json['departure_date'];
    arrivalDate = json['arrival_date'];
    departureSeal = json['departure_seal'];
    arrivalSeal = json['arrival_seal'];
    oldCompanyAddress = json['old_company_address'];
    travelledCountryIds = json['travelled_country_ids'];
    passportType = json['passport_type'];
    passportNumber = json['passport_number'];
    oldPassportNumber = json['old_passport_number'];
    passportIssueDate = json['passport_issue_date'];
    passportExpiredDate = json['passport_expired_date'];
    passportIssuePlace = json['passport_issue_place'];
    passportIssuePlaceName = json['passport_issue_place_name'];
    validityYear = json['validity_year'];
    passportScanCopy = json['passport_scan_copy'];
    passportNote = json['passport_note'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    divisionId = json['division_id'];
    divisionName = json['division_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    thanaId = json['thana_id'];
    thanaName = json['thana_name'];
    postofficeId = json['postoffice_id'];
    postofficeName = json['postoffice_name'];
    postofficeCode = json['postoffice_code'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    currentAddress = json['current_address'];
    permanentAddress = json['permanent_address'];
    candidatePhoto = json['candidate_photo'];
    policationVerificationFile = json['polication_verification_file'];
    otherCertification = json['other_certification'];
    optionalFiles = json['optional_files'];
    comments = json['comments'];
    isChield = json['is_chield'];
    status = json['status'];
    visaId = json['visa_id'];
    sponsorId = json['sponsor_id'];
    sponsorName = json['sponsor_name'];
    isStart = json['is_start'];
    isCompletaed = json['is_completaed'];
    runingStep = json['runing_step'];
    totalStep = json['total_step'];
    isDublicate = json['is_dublicate'];
    terminatedNote = json['terminated_note'];
    terminatedAttachment = json['terminated_attachment'];
    uploaderInfo = json['uploader_info'];
    data = json['data'];
    dateFilter = json['date_filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['candidate_type_id'] = this.candidateTypeId;
    data['candidate_type'] = this.candidateType;
    data['is_turiest'] = this.isTuriest;
    data['agent_id'] = this.agentId;
    data['agent_name'] = this.agentName;
    data['interested_country_id'] = this.interestedCountryId;
    data['interested_country_name'] = this.interestedCountryName;
    data['interested_job_id'] = this.interestedJobId;
    data['interested_job_name'] = this.interestedJobName;
    data['process_country_id'] = this.processCountryId;
    data['process_country_name'] = this.processCountryName;
    data['process_job_id'] = this.processJobId;
    data['process_job_name'] = this.processJobName;
    data['nationality'] = this.nationality;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['password'] = this.password;
    data['contact_number'] = this.contactNumber;
    data['nid_number'] = this.nidNumber;
    data['father_name'] = this.fatherName;
    data['mother_name'] = this.motherName;
    data['spouse_name'] = this.spouseName;
    data['nominee_name'] = this.nomineeName;
    data['religion'] = this.religion;
    data['marital_status'] = this.maritalStatus;
    data['blood_group'] = this.bloodGroup;
    data['nominee_relation'] = this.nomineeRelation;
    data['note'] = this.note;
    data['experiance_type'] = this.experianceType;
    data['old_company_name'] = this.oldCompanyName;
    data['old_job_id'] = this.oldJobId;
    data['old_job_name'] = this.oldJobName;
    data['departure_date'] = this.departureDate;
    data['arrival_date'] = this.arrivalDate;
    data['departure_seal'] = this.departureSeal;
    data['arrival_seal'] = this.arrivalSeal;
    data['old_company_address'] = this.oldCompanyAddress;
    data['travelled_country_ids'] = this.travelledCountryIds;
    data['passport_type'] = this.passportType;
    data['passport_number'] = this.passportNumber;
    data['old_passport_number'] = this.oldPassportNumber;
    data['passport_issue_date'] = this.passportIssueDate;
    data['passport_expired_date'] = this.passportExpiredDate;
    data['passport_issue_place'] = this.passportIssuePlace;
    data['passport_issue_place_name'] = this.passportIssuePlaceName;
    data['validity_year'] = this.validityYear;
    data['passport_scan_copy'] = this.passportScanCopy;
    data['passport_note'] = this.passportNote;
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['division_id'] = this.divisionId;
    data['division_name'] = this.divisionName;
    data['district_id'] = this.districtId;
    data['district_name'] = this.districtName;
    data['thana_id'] = this.thanaId;
    data['thana_name'] = this.thanaName;
    data['postoffice_id'] = this.postofficeId;
    data['postoffice_name'] = this.postofficeName;
    data['postoffice_code'] = this.postofficeCode;
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    data['current_address'] = this.currentAddress;
    data['permanent_address'] = this.permanentAddress;
    data['candidate_photo'] = this.candidatePhoto;
    data['polication_verification_file'] = this.policationVerificationFile;
    data['other_certification'] = this.otherCertification;
    data['optional_files'] = this.optionalFiles;
    data['comments'] = this.comments;
    data['is_chield'] = this.isChield;
    data['status'] = this.status;
    data['visa_id'] = this.visaId;
    data['sponsor_id'] = this.sponsorId;
    data['sponsor_name'] = this.sponsorName;
    data['is_start'] = this.isStart;
    data['is_completaed'] = this.isCompletaed;
    data['runing_step'] = this.runingStep;
    data['total_step'] = this.totalStep;
    data['is_dublicate'] = this.isDublicate;
    data['terminated_note'] = this.terminatedNote;
    data['terminated_attachment'] = this.terminatedAttachment;
    data['uploader_info'] = this.uploaderInfo;
    data['data'] = this.data;
    data['date_filter'] = this.dateFilter;
    return data;
  }
}
