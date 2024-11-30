class PromotionalModel {
  List<Data>? data;

  PromotionalModel({this.data});

  PromotionalModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? adsTitle;
  String? adsStartDate;
  String? adsExpiredDate;
  String? banner;
  String? adsUrl;
  String? note;
  String? status;
  String? uploaderInfo;
  String? data;
  String? dateFilter;

  Data(
      {this.id,
        this.adsTitle,
        this.adsStartDate,
        this.adsExpiredDate,
        this.banner,
        this.adsUrl,
        this.note,
        this.status,
        this.uploaderInfo,
        this.data,
        this.dateFilter});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adsTitle = json['ads_title'];
    adsStartDate = json['ads_start_date'];
    adsExpiredDate = json['ads_expired_date'];
    banner = json['banner'];
    adsUrl = json['ads_url'];
    note = json['note'];
    status = json['status'];
    uploaderInfo = json['uploader_info'];
    data = json['data'];
    dateFilter = json['date_filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ads_title'] = this.adsTitle;
    data['ads_start_date'] = this.adsStartDate;
    data['ads_expired_date'] = this.adsExpiredDate;
    data['banner'] = this.banner;
    data['ads_url'] = this.adsUrl;
    data['note'] = this.note;
    data['status'] = this.status;
    data['uploader_info'] = this.uploaderInfo;
    data['data'] = this.data;
    data['date_filter'] = this.dateFilter;
    return data;
  }
}
