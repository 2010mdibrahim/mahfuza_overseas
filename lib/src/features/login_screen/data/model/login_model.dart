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
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    data['type'] = type;
    if (candidate != null) {
      data['candidate'] = candidate!.toJson();
    }
    data['base_url'] = baseUrl;
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
  String? accountHeadId;
  String? accountHeadName;
  String? openingBalance;

  String? countryname;

  String? companyId;
  String? employeeName;
  String? takeRegistrationFee;
  String? registrationFeeAmount;
  String? agentPhoto;

  String? openingBalanceSheet;
  String? address;
  String? attachment;
  String? showTransaction;


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
        this.weekenDayName,
        this.accountHeadId,
        this.accountHeadName,
        this.openingBalance,
        this.countryname,
        this.companyId,
        this.employeeName,
        this.takeRegistrationFee,
        this.registrationFeeAmount,
        this.agentPhoto,
        this.openingBalanceSheet,
        this.address,
        this.attachment,
        this.showTransaction,
      });

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





    id = json['id'];
    accountHeadId = json['account_head_id'];
    accountHeadName = json['account_head_name'];
    agentName = json['agent_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    password = json['password'];
    openingBalance = json['opening_balance'];
    dateOfBirth = json['date_of_birth'];
    countryId = json['country_id'];
    countryname = json['countryname'];
    employeeId = json['employee_id'];
    companyId = json['company_id'];
    employeeName = json['employee_name'];
    takeRegistrationFee = json['take_registration_fee'];
    registrationFeeAmount = json['registration_fee_amount'];
    agentPhoto = json['agent_photo'];
    passportScanCopy = json['passport_scan_copy'];
    openingBalanceSheet = json['opening_balance_sheet'];
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
    permanentAddress = json['permanent_address'];
    address = json['address'];
    note = json['note'];
    attachment = json['attachment'];
    status = json['status'];
    uploaderInfo = json['uploader_info'];
    data = json['data'];
    dateFilter = json['date_filter'];
    showTransaction = json['show_transaction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['candidate_type_id'] = candidateTypeId;
    data['candidate_type'] = candidateType;
    data['is_turiest'] = isTuriest;
    data['agent_id'] = agentId;
    data['agent_name'] = agentName;
    data['interested_country_id'] = interestedCountryId;
    data['interested_country_name'] = interestedCountryName;
    data['interested_job_id'] = interestedJobId;
    data['interested_job_name'] = interestedJobName;
    data['process_country_id'] = processCountryId;
    data['process_country_name'] = processCountryName;
    data['process_job_id'] = processJobId;
    data['process_job_name'] = processJobName;
    data['nationality'] = nationality;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['full_name'] = fullName;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    data['contact_number'] = contactNumber;
    data['nid_number'] = nidNumber;
    data['father_name'] = fatherName;
    data['mother_name'] = motherName;
    data['spouse_name'] = spouseName;
    data['nominee_name'] = nomineeName;
    data['religion'] = religion;
    data['marital_status'] = maritalStatus;
    data['blood_group'] = bloodGroup;
    data['nominee_relation'] = nomineeRelation;
    data['note'] = note;
    data['experiance_type'] = experianceType;
    data['old_company_name'] = oldCompanyName;
    data['old_job_id'] = oldJobId;
    data['old_job_name'] = oldJobName;
    data['departure_date'] = departureDate;
    data['arrival_date'] = arrivalDate;
    data['departure_seal'] = departureSeal;
    data['arrival_seal'] = arrivalSeal;
    data['old_company_address'] = oldCompanyAddress;
    data['travelled_country_ids'] = travelledCountryIds;
    data['passport_type'] = passportType;
    data['passport_number'] = passportNumber;
    data['passport_issue_date'] = passportIssueDate;
    data['passport_expired_date'] = passportExpiredDate;
    data['passport_issue_place'] = passportIssuePlace;
    data['passport_issue_place_name'] = passportIssuePlaceName;
    data['validity_year'] = validityYear;
    data['passport_scan_copy'] = passportScanCopy;
    data['passport_note'] = passportNote;
    data['country_id'] = countryId;
    data['country_name'] = countryName;
    data['division_id'] = divisionId;
    data['division_name'] = divisionName;
    data['district_id'] = districtId;
    data['district_name'] = districtName;
    data['thana_id'] = thanaId;
    data['thana_name'] = thanaName;
    data['postoffice_id'] = postofficeId;
    data['postoffice_name'] = postofficeName;
    data['postoffice_code'] = postofficeCode;
    data['state_id'] = stateId;
    data['state_name'] = stateName;
    data['current_address'] = currentAddress;
    data['permanent_address'] = permanentAddress;
    data['candidate_photo'] = candidatePhoto;
    data['polication_verification_file'] = policationVerificationFile;
    data['other_certification'] = otherCertification;
    data['optional_files'] = optionalFiles;
    data['comments'] = comments;
    data['status'] = status;
    data['visa_id'] = visaId;
    data['sponsor_id'] = sponsorId;
    data['sponsor_name'] = sponsorName;
    data['is_start'] = isStart;
    data['is_completaed'] = isCompletaed;
    data['runing_step'] = runingStep;
    data['total_step'] = totalStep;
    data['is_dublicate'] = isDublicate;
    data['terminated_note'] = terminatedNote;
    data['terminated_attachment'] = terminatedAttachment;
    data['uploader_info'] = uploaderInfo;
    data['data'] = this.data;
    data['date_filter'] = dateFilter;
    data['f_name'] = fName;
    data['l_name'] = lName;
    data['date_of_joining'] = dateOfJoining;
    data['personal_Phone'] = personalPhone;
    data['contact_person_number'] = contactPersonNumber;
    data['avater_photo'] = avaterPhoto;
    data['company_phone'] = companyPhone;
    data['company_email'] = companyEmail;
    data['nid_number'] = nidNumber;
    data['branch_id'] = branchId;
    data['branch_name'] = branchName;
    data['branch_code'] = branchCode;
    data['employee_id'] = employeeId;
    data['role_id'] = roleId;
    data['role_name'] = roleName;
    data['role_code'] = roleCode;
    data['department_id'] = departmentId;
    data['department_name'] = departmentName;
    data['department_code'] = departmentCode;
    data['designation_id'] = designationId;
    data['designation_name'] = designationName;
    data['designation_code'] = designationCode;
    data['basic_salary_monthly'] = basicSalaryMonthly;
    data['basic_salary_daily'] = basicSalaryDaily;
    data['mobile_allowance'] = mobileAllowance;
    data['salary_pay_method'] = salaryPayMethod;
    data['contruct_type'] = contructType;
    data['access_card'] = accessCard;
    data['white_list'] = whiteList;
    data['roaster_id'] = roasterId;
    data['roaster_name'] = roasterName;
    data['roaster_code'] = roasterCode;
    data['weeken_day_id'] = weekenDayId;
    data['weeken_day_name'] = weekenDayName;




    data['id'] = id;
    data['account_head_id'] = accountHeadId;
    data['account_head_name'] = accountHeadName;
    data['agent_name'] = agentName;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['password'] = password;
    data['opening_balance'] = openingBalance;
    data['date_of_birth'] = dateOfBirth;
    data['country_id'] = countryId;
    data['countryname'] = countryname;
    data['employee_id'] = employeeId;
    data['company_id'] = companyId;
    data['employee_name'] = employeeName;
    data['take_registration_fee'] = takeRegistrationFee;
    data['registration_fee_amount'] = registrationFeeAmount;
    data['agent_photo'] = agentPhoto;
    data['passport_scan_copy'] = passportScanCopy;
    data['opening_balance_sheet'] = openingBalanceSheet;
    data['division_id'] = divisionId;
    data['division_name'] = divisionName;
    data['district_id'] = districtId;
    data['district_name'] = districtName;
    data['thana_id'] = thanaId;
    data['thana_name'] = thanaName;
    data['postoffice_id'] = postofficeId;
    data['postoffice_name'] = postofficeName;
    data['postoffice_code'] = postofficeCode;
    data['state_id'] = stateId;
    data['state_name'] = stateName;
    data['permanent_address'] = permanentAddress;
    data['address'] = address;
    data['note'] = note;
    data['attachment'] = attachment;
    data['status'] = status;
    data['uploader_info'] = uploaderInfo;
    data['data'] = this.data;
    data['date_filter'] = dateFilter;
    data['show_transaction'] = showTransaction;

    return data;
  }
}
