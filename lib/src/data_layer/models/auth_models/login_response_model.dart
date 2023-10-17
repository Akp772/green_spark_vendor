class LoginResponseModel {
  int? httpStatusCode;
  bool? status;
  Context? context;
  String? timestamp;
  String? message;

  LoginResponseModel(
      {this.httpStatusCode,
        this.status,
        this.context,
        this.timestamp,
        this.message});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['http_status_code'];
    status = json['status'];
    context =
    json['context'] != null ? Context.fromJson(json['context']) : null;
    timestamp = json['timestamp'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
  Data? data;

  Context({this.data});

  Context.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? adminApproval;
  String? createdAt;
  String? updatedAt;
  String? otp;
  String? isVerified;
  String? nickname;
  String? dob;
  String? details;
  String? deviceId;
  String? mobileNumber;
  String? countryCode;
  String? profilePic;
  String? fcmToken;
  String? otpCreatedAt;
  String? deviceType;
  String? authProvider;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.adminApproval,
        this.createdAt,
        this.updatedAt,
        this.otp,
        this.isVerified,
        this.nickname,
        this.dob,
        this.details,
        this.deviceId,
        this.mobileNumber,
        this.countryCode,
        this.profilePic,
        this.fcmToken,
        this.otpCreatedAt,
        this.deviceType,
        this.authProvider});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    adminApproval = json['admin_approval'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    otp = json['otp'];
    isVerified = json['is_verified'];
    nickname = json['nickname'];
    dob = json['dob'];
    details = json['details'];
    deviceId = json['device_id'];
    mobileNumber = json['mobile_number'];
    countryCode = json['country_code'];
    profilePic = json['profile_pic'];
    fcmToken = json['fcm_token'];
    otpCreatedAt = json['otp_created_at'];
    deviceType = json['device_type'];
    authProvider = json['auth_provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['admin_approval'] = adminApproval;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['otp'] = otp;
    data['is_verified'] = isVerified;
    data['nickname'] = nickname;
    data['dob'] = dob;
    data['details'] = details;
    data['device_id'] = deviceId;
    data['mobile_number'] = mobileNumber;
    data['country_code'] = countryCode;
    data['profile_pic'] = profilePic;
    data['fcm_token'] = fcmToken;
    data['otp_created_at'] = otpCreatedAt;
    data['device_type'] = deviceType;
    data['auth_provider'] = authProvider;
    return data;
  }
}
