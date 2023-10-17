class SignInRequestModel {
  String? userId;
  String? password;
  String? authProvider;
  String? deviceId;
  String? deviceType;
  String? fcmToken;

  SignInRequestModel(
      {this.userId,
        this.password,
        this.authProvider,
        this.deviceId,
        this.deviceType,
        this.fcmToken});

  SignInRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    password = json['password'];
    authProvider = json['auth_provider'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['password'] = this.password;
    data['auth_provider'] = this.authProvider;
    data['device_id'] = this.deviceId;
    data['device_type'] = this.deviceType;
    data['fcm_token'] = this.fcmToken;
    return data;
  }
}
