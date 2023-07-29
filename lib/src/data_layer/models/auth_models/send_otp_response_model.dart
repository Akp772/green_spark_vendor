class SendOTPResponseModel {
  String? responseCode;
  int? httpStatusCode;
  Context? context;
  String? timestamp;

  SendOTPResponseModel(
      {this.responseCode, this.httpStatusCode, this.context, this.timestamp});

  SendOTPResponseModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (success != null) {
      data['success'] = success!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Success {
  String? otpType;

  Success({this.otpType});

  Success.fromJson(Map<String, dynamic> json) {
    otpType = json['otp_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['otp_type'] = otpType;
    return data;
  }
}
