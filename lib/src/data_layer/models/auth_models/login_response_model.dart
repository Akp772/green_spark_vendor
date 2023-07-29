class LoginResponseModel {
  String? responseCode;
  int? httpStatusCode;
  Context? context;
  String? timestamp;

  LoginResponseModel(
      {this.responseCode, this.httpStatusCode, this.context, this.timestamp});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? message;

  Context({this.success, this.message});

  Context.fromJson(Map<String, dynamic> json) {
    success =
    json['success'] != null ? Success.fromJson(json['success']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (success != null) {
      data['success'] = success!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Success {
  String? info;
  String? token;
  bool? phoneNo;
  bool? phoneNoVerify;

  Success({this.info, this.token, this.phoneNo, this.phoneNoVerify});

  Success.fromJson(Map<String, dynamic> json) {
    info = json['info'];
    token = json['token'];
    phoneNo = json['phone_no'];
    phoneNoVerify = json['phone_no_verify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['info'] = info;
    data['token'] = token;
    data['phone_no'] = phoneNo;
    data['phone_no_verify'] = phoneNoVerify;
    return data;
  }
}
