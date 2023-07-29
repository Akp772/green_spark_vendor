class CommonResponseModel {
  bool? success;
  int? status;
  String? message;
  String? purpose;

  CommonResponseModel({this.success, this.status, this.message, this.purpose});

  CommonResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    purpose = json['purpose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    data['purpose'] = this.purpose;
    return data;
  }
}
