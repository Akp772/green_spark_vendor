class SocialLoginRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? socialId, errorMessage;
  String loginType;
  String deviceToken;
  bool hasData;
  bool? isPrivacyAccepted, isPreEmail;
  int? number;

  SocialLoginRequestModel(
      {this.email,
      required this.deviceToken,
      this.firstName,
      this.lastName,
      required this.loginType,
      this.phone,
      this.socialId,
      required this.hasData,
      this.errorMessage,
      this.isPreEmail,
      this.number,
      this.isPrivacyAccepted});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["firstName"] = firstName;
    if (lastName != null && lastName!.trim().isNotEmpty) {
      map["lastName"] = lastName;
    }
    if (email != null && email!.isNotEmpty) {
      map["email"] = email;
    }
    map["phone"] = phone;
    map["socialId"] = socialId;
    map["login_type"] = loginType;
    map['device_token'] = deviceToken;
    map['socialType'] = loginType;
    map['newsLetter'] = isPrivacyAccepted ?? false;
    map['isPreEmail'] = isPreEmail;
    // map["deviceToken"] = AppConstant.FireBaseToken;
    // map["deviceType"] = AppInfo.getDeviceTypeAsNumber();
    return map;
  }
}

class FacebookUser {
  String? name, firstName, lastName, email, id, additionalInfo;

  FacebookUser(
      {this.lastName,
      this.firstName,
      this.email,
      this.id,
      this.name,
      this.additionalInfo});

  FacebookUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    id = json['id'];
  }
}
