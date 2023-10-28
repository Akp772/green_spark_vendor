class AddAttributeResponseModel {
  int? httpStatusCode;
  bool? status;
  Context? context;
  String? timestamp;
  String? message;

  AddAttributeResponseModel(
      {this.httpStatusCode,
        this.status,
        this.context,
        this.timestamp,
        this.message});

  AddAttributeResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? attributeType;
  String? attributeName;
  String? listOrder;
  int? createdBy;
  int? updatedBy;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.attributeType,
        this.attributeName,
        this.listOrder,
        this.createdBy,
        this.updatedBy,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    attributeType = json['attribute_type'];
    attributeName = json['attribute_name'];
    listOrder = json['list_order'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['attribute_type'] = attributeType;
    data['attribute_name'] = attributeName;
    data['list_order'] = listOrder;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
