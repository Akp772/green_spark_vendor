class ForgotPasswordResponseModel {
  String? responseCode;
  int? httpStatusCode;
  Context? context;
  String? timestamp;

  ForgotPasswordResponseModel(
      {this.responseCode, this.httpStatusCode, this.context, this.timestamp});

  ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    httpStatusCode = json['http_status_code'];
    context =
    json['context'] != null ? Context.fromJson(json['context']) : null;
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
  String? message;

  Context({this.message});

  Context.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    return data;
  }
}
