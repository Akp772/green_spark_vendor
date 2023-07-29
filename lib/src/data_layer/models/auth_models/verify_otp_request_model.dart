class VerifyOTPRequestModel {
  String? email;
  String? otp;
  String? otpType;

  VerifyOTPRequestModel({this.email, this.otp, this.otpType});

  VerifyOTPRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    otp = json['otp'];
    otpType = json['otp_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['otp'] = otp;
    data['otp_type'] = otpType;
    return data;
  }
}
