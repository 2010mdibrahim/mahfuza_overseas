class AgentBalanceModel {
  String? status;
  String? code;
  Data? data;

  AgentBalanceModel({this.status, this.code, this.data});

  AgentBalanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? accountHeadName;
  String? accountHeadType;
  String? parentId;
  String? parentName;
  String? balance;
  String? openingBalance;
  String? note;
  String? status;
  String? uploaderInfo;
  String? data;
  String? dateFilter;

  Data(
      {this.id,
        this.accountHeadName,
        this.accountHeadType,
        this.parentId,
        this.parentName,
        this.balance,
        this.openingBalance,
        this.note,
        this.status,
        this.uploaderInfo,
        this.data,
        this.dateFilter});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountHeadName = json['account_head_name'];
    accountHeadType = json['account_head_type'];
    parentId = json['parent_id'];
    parentName = json['parent_name'];
    balance = json['balance'];
    openingBalance = json['opening_balance'];
    note = json['note'];
    status = json['status'];
    uploaderInfo = json['uploader_info'];
    data = json['data'];
    dateFilter = json['date_filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account_head_name'] = this.accountHeadName;
    data['account_head_type'] = this.accountHeadType;
    data['parent_id'] = this.parentId;
    data['parent_name'] = this.parentName;
    data['balance'] = this.balance;
    data['opening_balance'] = this.openingBalance;
    data['note'] = this.note;
    data['status'] = this.status;
    data['uploader_info'] = this.uploaderInfo;
    data['data'] = this.data;
    data['date_filter'] = this.dateFilter;
    return data;
  }
}
