class AgentTransactionListModel {
  String? status;
  String? code;
  String? type;
  int? total;
  List<Data>? data;

  AgentTransactionListModel(
      {this.status, this.code, this.type, this.total, this.data});

  AgentTransactionListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    type = json['type'];
    total = json['total'];
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
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? transactionType;
  String? particularType;
  String? particularId;
  String? particularName;
  String? particularHeadId;
  String? particularHeadName;
  String? accountHeadId;
  String? accountHeadName;
  String? currencyId;
  String? currencyName;
  String? conversionRate;
  String? conversionCode;
  String? amount;
  String? bdtAmount;
  String? attachment;
  String? transactionNote;
  String? note;
  String? uploaderInfo;
  String? data;
  String? dateFilter;

  Data(
      {this.id,
        this.transactionType,
        this.particularType,
        this.particularId,
        this.particularName,
        this.particularHeadId,
        this.particularHeadName,
        this.accountHeadId,
        this.accountHeadName,
        this.currencyId,
        this.currencyName,
        this.conversionRate,
        this.conversionCode,
        this.amount,
        this.bdtAmount,
        this.attachment,
        this.transactionNote,
        this.note,
        this.uploaderInfo,
        this.data,
        this.dateFilter});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionType = json['transaction_type'];
    particularType = json['particular_type'];
    particularId = json['particular_id'];
    particularName = json['particular_name'];
    particularHeadId = json['particular_head_id'];
    particularHeadName = json['particular_head_name'];
    accountHeadId = json['account_head_id'];
    accountHeadName = json['account_head_name'];
    currencyId = json['currency_id'];
    currencyName = json['currency_name'];
    conversionRate = json['conversion_rate'];
    conversionCode = json['conversion_code'];
    amount = json['amount'];
    bdtAmount = json['bdt_amount'];
    attachment = json['attachment'];
    transactionNote = json['transaction_note'];
    note = json['note'];
    uploaderInfo = json['uploader_info'];
    data = json['data'];
    dateFilter = json['date_filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transaction_type'] = this.transactionType;
    data['particular_type'] = this.particularType;
    data['particular_id'] = this.particularId;
    data['particular_name'] = this.particularName;
    data['particular_head_id'] = this.particularHeadId;
    data['particular_head_name'] = this.particularHeadName;
    data['account_head_id'] = this.accountHeadId;
    data['account_head_name'] = this.accountHeadName;
    data['currency_id'] = this.currencyId;
    data['currency_name'] = this.currencyName;
    data['conversion_rate'] = this.conversionRate;
    data['conversion_code'] = this.conversionCode;
    data['amount'] = this.amount;
    data['bdt_amount'] = this.bdtAmount;
    data['attachment'] = this.attachment;
    data['transaction_note'] = this.transactionNote;
    data['note'] = this.note;
    data['uploader_info'] = this.uploaderInfo;
    data['data'] = this.data;
    data['date_filter'] = this.dateFilter;
    return data;
  }
}
