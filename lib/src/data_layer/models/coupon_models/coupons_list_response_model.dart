class AllCouponResponseModel {
  int? httpStatusCode;
  bool? status;
  Context? context;
  String? timestamp;
  String? message;

  AllCouponResponseModel(
      {this.httpStatusCode,
        this.status,
        this.context,
        this.timestamp,
        this.message});

  AllCouponResponseModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['http_status_code'];
    status = json['status'];
    context =
    json['context'] != null ? Context.fromJson(json['context']) : null;
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
  List<CouponsData>? data;

  Context({this.data});

  Context.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CouponsData>[];
      json['data'].forEach((v) {
        data!.add(CouponsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CouponsData {
  int? id;
  String? code;
  String? couponType;
  String? amount;
  String? expiryDate;
  String? noOfCoupons;
  String? createdBy;
  String? status;
  String? usedCoupons;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  CouponsData(
      {this.id,
        this.code,
        this.couponType,
        this.amount,
        this.expiryDate,
        this.noOfCoupons,
        this.createdBy,
        this.status,
        this.usedCoupons,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  CouponsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    couponType = json['coupon_type'];
    amount = json['amount'];
    expiryDate = json['expiry_date'];
    noOfCoupons = json['no_of_coupons'];
    createdBy = json['created_by'];
    status = json['status'];
    // usedCoupons = json['used_coupons'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['coupon_type'] = couponType;
    data['amount'] = amount;
    data['expiry_date'] = expiryDate;
    data['no_of_coupons'] = noOfCoupons;
    data['created_by'] = createdBy;
    data['status'] = status;
    data['used_coupons'] = usedCoupons;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
