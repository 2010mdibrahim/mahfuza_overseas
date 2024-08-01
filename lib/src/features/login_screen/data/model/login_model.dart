class LoginModel {
  String? status;
  String? code;
  String? message;
  String? type;
  Candidate? candidate;
  String? baseUrl;

  LoginModel(
      {this.status, this.code, this.message, this.candidate, this.baseUrl});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    type = json['type'];
    candidate = json['candidate'] != null
        ? new Candidate.fromJson(json['candidate'])
        : null;
    baseUrl = json['base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    data['type'] = this.type;
    if (this.candidate != null) {
      data['candidate'] = this.candidate!.toJson();
    }
    data['base_url'] = this.baseUrl;
    return data;
  }
}

class Candidate {
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
  // String? id;
  // String? email;
  // String? password;
  String? fName;
  String? lName;
  String? dateOfJoining;
  String? personalPhone;
  String? contactPersonNumber;
  String? avaterPhoto;
  String? companyPhone;
  String? companyEmail;
  // String? nidNumber;
  String? branchId;
  String? branchName;
  String? branchCode;
  // String? currentAddress;
  // String? permanentAddress;
  // String? note;
  String? employeeId;
  String? roleId;
  String? roleName;
  String? roleCode;
  String? departmentId;
  String? departmentName;
  String? departmentCode;
  String? designationId;
  String? designationName;
  String? designationCode;
  String? basicSalaryMonthly;
  String? basicSalaryDaily;
  String? mobileAllowance;
  String? salaryPayMethod;
  String? contructType;
  String? accessCard;
  String? whiteList;
  String? roasterId;
  String? roasterName;
  String? roasterCode;
  String? weekenDayId;
  String? weekenDayName;
  // String? status;
  // String? uploaderInfo;
  // String? data;
  // String? dateFilter;

  Candidate(
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
        this.fName,
        this.lName,
        this.dateOfJoining,
        this.dateFilter,
        this.personalPhone,
        this.contactPersonNumber,
        this.avaterPhoto,
        this.companyPhone,
        this.companyEmail,
        this.branchId,
        this.branchName,
        this.branchCode,
        this.employeeId,
        this.roleId,
        this.roleName,
        this.roleCode,
        this.departmentId,
        this.departmentName,
        this.departmentCode,
        this.designationId,
        this.designationName,
        this.designationCode,
        this.basicSalaryMonthly,
        this.basicSalaryDaily,
        this.mobileAllowance,
        this.salaryPayMethod,
        this.contructType,
        this.accessCard,
        this.whiteList,
        this.roasterId,
        this.roasterName,
        this.roasterCode,
        this.weekenDayId,
        this.weekenDayName});

  Candidate.fromJson(Map<String, dynamic> json) {
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
    fName = json['f_name'];
    lName = json['l_name'];
    dateOfJoining = json['date_of_joining'];
    personalPhone = json['personal_Phone'];
    contactPersonNumber = json['contact_person_number'];
    avaterPhoto = json['avater_photo'];
    companyPhone = json['company_phone'];
    companyEmail = json['company_email'];
    nidNumber = json['nid_number'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    branchCode = json['branch_code'];

    employeeId = json['employee_id'];
    roleId = json['role_id'];
    roleName = json['role_name'];
    roleCode = json['role_code'];
    departmentId = json['department_id'];
    departmentName = json['department_name'];
    departmentCode = json['department_code'];
    designationId = json['designation_id'];
    designationName = json['designation_name'];
    designationCode = json['designation_code'];
    basicSalaryMonthly = json['basic_salary_monthly'];
    basicSalaryDaily = json['basic_salary_daily'];
    mobileAllowance = json['mobile_allowance'];
    salaryPayMethod = json['salary_pay_method'];
    contructType = json['contruct_type'];
    accessCard = json['access_card'];
    whiteList = json['white_list'];
    roasterId = json['roaster_id'];
    roasterName = json['roaster_name'];
    roasterCode = json['roaster_code'];
    weekenDayId = json['weeken_day_id'];
    weekenDayName = json['weeken_day_name'];
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
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['date_of_joining'] = this.dateOfJoining;
    data['personal_Phone'] = this.personalPhone;
    data['contact_person_number'] = this.contactPersonNumber;
    data['avater_photo'] = this.avaterPhoto;
    data['company_phone'] = this.companyPhone;
    data['company_email'] = this.companyEmail;
    data['nid_number'] = this.nidNumber;
    data['branch_id'] = this.branchId;
    data['branch_name'] = this.branchName;
    data['branch_code'] = this.branchCode;
    data['employee_id'] = this.employeeId;
    data['role_id'] = this.roleId;
    data['role_name'] = this.roleName;
    data['role_code'] = this.roleCode;
    data['department_id'] = this.departmentId;
    data['department_name'] = this.departmentName;
    data['department_code'] = this.departmentCode;
    data['designation_id'] = this.designationId;
    data['designation_name'] = this.designationName;
    data['designation_code'] = this.designationCode;
    data['basic_salary_monthly'] = this.basicSalaryMonthly;
    data['basic_salary_daily'] = this.basicSalaryDaily;
    data['mobile_allowance'] = this.mobileAllowance;
    data['salary_pay_method'] = this.salaryPayMethod;
    data['contruct_type'] = this.contructType;
    data['access_card'] = this.accessCard;
    data['white_list'] = this.whiteList;
    data['roaster_id'] = this.roasterId;
    data['roaster_name'] = this.roasterName;
    data['roaster_code'] = this.roasterCode;
    data['weeken_day_id'] = this.weekenDayId;
    data['weeken_day_name'] = this.weekenDayName;
    return data;
  }
}
