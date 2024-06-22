class NotificationModel {
  String? status;
  String? code;
  List<Data>? data;

  NotificationModel({this.status, this.code, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? promotionId;
  String? candidateId;
  String? candidateName;
  String? promotionTitle;
  String? promotionBanner;
  String? uploaderInfo;
  String? data;
  String? dateFilter;
  String? view;

  Data(
      {this.id,
        this.promotionId,
        this.candidateId,
        this.candidateName,
        this.promotionTitle,
        this.promotionBanner,
        this.uploaderInfo,
        this.data,
        this.dateFilter,
        this.view});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    promotionId = json['promotion_id'];
    candidateId = json['candidate_id'];
    candidateName = json['candidate_name'];
    promotionTitle = json['promotion_title'];
    promotionBanner = json['promotion_banner'];
    uploaderInfo = json['uploader_info'];
    data = json['data'];
    dateFilter = json['date_filter'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['promotion_id'] = this.promotionId;
    data['candidate_id'] = this.candidateId;
    data['candidate_name'] = this.candidateName;
    data['promotion_title'] = this.promotionTitle;
    data['promotion_banner'] = this.promotionBanner;
    data['uploader_info'] = this.uploaderInfo;
    data['data'] = this.data;
    data['date_filter'] = this.dateFilter;
    data['view'] = this.view;
    return data;
  }
}
