class AddCouponResponseModel {
  int? httpStatusCode;
  bool? status;
  Context? context;
  String? timestamp;
  String? message;

  AddCouponResponseModel(
      {this.httpStatusCode,
        this.status,
        this.context,
        this.timestamp,
        this.message});

  AddCouponResponseModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['http_status_code'];
    status = json['status'];
    context =
    json['context'] != null ? new Context.fromJson(json['context']) : null;
    timestamp = json['timestamp'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['http_status_code'] = httpStatusCode;
    data['status'] = status;
    if (context != null) {
      data['context'] = context!.toJson();
    }
    data['timestamp'] = timestamp;
    data['message'] = message;
    return data;
  }
}

class Context {
  List<Data>? data;

  Context({this.data});

  Context.fromJson(Map<String, dynamic> json) {
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
  String? code;
  String? couponType;
  int? amount;
  String? expiryDate;
  int? noOfCoupons;
  int? createdBy;

  Data(
      {this.code,
        this.couponType,
        this.amount,
        this.expiryDate,
        this.noOfCoupons,
        this.createdBy});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    couponType = json['coupon_type'];
    amount = json['amount'];
    expiryDate = json['expiry_date'];
    noOfCoupons = json['no_of_coupons'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['coupon_type'] = couponType;
    data['amount'] = amount;
    data['expiry_date'] = expiryDate;
    data['no_of_coupons'] = noOfCoupons;
    data['created_by'] = createdBy;
    return data;
  }
}
