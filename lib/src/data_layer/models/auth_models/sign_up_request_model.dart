class SignUpRequestModel {
  String? email;
  String? password;
  String? phoneNo;

  SignUpRequestModel({this.email, this.password, this.phoneNo});

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    phoneNo = json['phone_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['phone_no'] = phoneNo;
    return data;
  }
}
