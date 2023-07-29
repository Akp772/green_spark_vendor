class RefreshTokenResponseModel {
  bool? success;
  int? status;
  String? message;
  Data? data;
  Null? error;
  String? purpose;

  RefreshTokenResponseModel(
      {this.success,
      this.status,
      this.message,
      this.data,
      this.error,
      this.purpose});

  RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
    purpose = json['purpose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    data['purpose'] = this.purpose;
    return data;
  }
}

class Data {
  String? accessToken;

  Data({this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    return data;
  }
}
