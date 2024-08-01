class EmployeeModel {
  String? status;
  String? code;
  String? message;
  String? type;
  Employee? employee;
  String? baseUrl;

  EmployeeModel(
      {this.status,
        this.code,
        this.message,
        this.type,
        this.employee,
        this.baseUrl});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    type = json['type'];
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
    baseUrl = json['base_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    data['type'] = this.type;
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    data['base_url'] = this.baseUrl;
    return data;
  }
}

class Employee {
  String? id;
  String? email;
  String? password;
  String? fName;
  String? lName;
  String? fullName;
  String? religion;
  String? gender;
  String? maritalStatus;
  String? dateOfBirth;
  String? dateOfJoining;
  String? bloodGroup;
  String? personalPhone;
  String? contactPersonNumber;
  String? avaterPhoto;
  String? companyPhone;
  String? companyEmail;
  String? nidNumber;
  String? branchId;
  String? branchName;
  String? branchCode;
  String? currentAddress;
  String? permanentAddress;
  String? note;
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
  String? status;
  String? uploaderInfo;
  String? data;
  String? dateFilter;

  Employee(
      {
        this.personalPhone,
        this.contactPersonNumber,
        this.avaterPhoto,
        this.companyPhone,
        this.companyEmail,
        this.nidNumber,
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
});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    fName = json['f_name'];
    lName = json['l_name'];
    dateOfJoining = json['date_of_joining'];
    fullName = json['full_name'];
    religion = json['religion'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    dateOfBirth = json['date_of_birth'];
    bloodGroup = json['blood_group'];
    personalPhone = json['personal_Phone'];
    contactPersonNumber = json['contact_person_number'];
    avaterPhoto = json['avater_photo'];
    companyPhone = json['company_phone'];
    companyEmail = json['company_email'];
    nidNumber = json['nid_number'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    branchCode = json['branch_code'];
    currentAddress = json['current_address'];
    permanentAddress = json['permanent_address'];
    note = json['note'];
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
    status = json['status'];
    uploaderInfo = json['uploader_info'];
    data = json['data'];
    dateFilter = json['date_filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['date_of_joining'] = this.dateOfJoining;
    data['full_name'] = this.fullName;
    data['religion'] = this.religion;
    data['gender'] = this.gender;
    data['marital_status'] = this.maritalStatus;
    data['date_of_birth'] = this.dateOfBirth;
    data['blood_group'] = this.bloodGroup;
    data['personal_Phone'] = this.personalPhone;
    data['contact_person_number'] = this.contactPersonNumber;
    data['avater_photo'] = this.avaterPhoto;
    data['company_phone'] = this.companyPhone;
    data['company_email'] = this.companyEmail;
    data['nid_number'] = this.nidNumber;
    data['branch_id'] = this.branchId;
    data['branch_name'] = this.branchName;
    data['branch_code'] = this.branchCode;
    data['current_address'] = this.currentAddress;
    data['permanent_address'] = this.permanentAddress;
    data['note'] = this.note;
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
    data['status'] = this.status;
    data['uploader_info'] = this.uploaderInfo;
    data['data'] = this.data;
    data['date_filter'] = this.dateFilter;
    return data;
  }
}
