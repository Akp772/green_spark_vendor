class GetProfileResponseModel {
  String? responseCode;
  int? httpStatusCode;
  Context? context;
  String? timestamp;

  GetProfileResponseModel(
      {this.responseCode, this.httpStatusCode, this.context, this.timestamp});

  GetProfileResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    httpStatusCode = json['http_status_code'];
    context =
    json['context'] != null ? Context.fromJson(json['context']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    data['http_status_code'] = httpStatusCode;
    if (context != null) {
      data['context'] = context!.toJson();
    }
    data['timestamp'] = timestamp;
    return data;
  }
}

class Context {
  Success? success;

  Context({this.success});

  Context.fromJson(Map<String, dynamic> json) {
    success =
    json['success'] != null ? Success.fromJson(json['success']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (success != null) {
      data['success'] = success!.toJson();
    }
    return data;
  }
}

class Success {
  String? lat;
  String? lng;
  int? id;
  String? fullName;
  String? gender;
  String? phoneNo;
  String? dob;
  String? email;
  String? username;
  String? aboutMe;
  String? profilePic;

  Success(
      {this.lat,
        this.lng,
        this.id,
        this.fullName,
        this.gender,
        this.phoneNo,
        this.dob,
        this.email,
        this.username,
        this.aboutMe,
        this.profilePic});

  Success.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    id = json['id'];
    fullName = json['full_name'];
    gender = json['gender'];
    phoneNo = json['phone_no'];
    dob = json['dob'];
    email = json['email'];
    username = json['username'];
    aboutMe = json['about_me'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    data['id'] = id;
    data['full_name'] = fullName;
    data['gender'] = gender;
    data['phone_no'] = phoneNo;
    data['dob'] = dob;
    data['email'] = email;
    data['username'] = username;
    data['about_me'] = aboutMe;
    data['profile_pic'] = profilePic;
    return data;
  }
}
