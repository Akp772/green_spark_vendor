class ForgotPasswordRequestModel {
  String? email;
  String? password;
  String? confirmPassword;

  ForgotPasswordRequestModel({this.email, this.password, this.confirmPassword});

  ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['confirm_password'] = confirmPassword;
    return data;
  }
}

