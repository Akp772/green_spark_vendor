class UploadImageResponse {
  bool? success;
  int? status;
  String? message;
  Data? data;
  String? error;
  String? purpose;

  UploadImageResponse(
      {this.success,
      this.status,
      this.message,
      this.data,
      this.error,
      this.purpose});

  UploadImageResponse.fromJson(Map<String, dynamic> json) {
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
  String? url;

  Data({this.url});

  Data.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
