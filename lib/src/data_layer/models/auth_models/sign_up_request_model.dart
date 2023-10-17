class SignUpRequestModel {
  String? email;
  String? password;
  String? passwordConfirmation;
  int? mobileNumber;
  String? shopName;
  String? authProvider;
  String? name;
  String? deviceType;
  String? fcmToken;
  String? countryCode;

  SignUpRequestModel(
      {this.email,
        this.password,
        this.passwordConfirmation,
        this.mobileNumber,
        this.shopName,
        this.authProvider,
        this.name,
        this.deviceType,
        this.fcmToken
      });

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    mobileNumber = json['mobile_number'];
    shopName = json['shop_name'];
    authProvider = json['auth_provider'];
    name = json['name'];
    deviceType = json['device_type'];
    fcmToken = json['fcm_token'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    data['mobile_number'] = mobileNumber;
    data['shop_name'] = shopName;
    data['auth_provider'] = authProvider;
    data['name'] = name;
    data['device_type'] = deviceType;
    data['fcm_token'] = fcmToken;
    return data;
  }
}
