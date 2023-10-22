class AddCouponRequestModel {
  String? code;
  int? amount;
  String? couponType;
  int? noOfCoupons;
  String? expiryDate;

  AddCouponRequestModel(
      {this.code,
        this.amount,
        this.couponType,
        this.noOfCoupons,
        this.expiryDate});

  AddCouponRequestModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    amount = json['amount'];
    couponType = json['coupon_type'];
    noOfCoupons = json['no_of_coupons'];
    expiryDate = json['expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['amount'] = amount;
    data['coupon_type'] = couponType;
    data['no_of_coupons'] = noOfCoupons;
    data['expiry_date'] = expiryDate;
    return data;
  }
}
