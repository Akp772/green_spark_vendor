class CategoryResponseModel {
  String? responseCode;
  int? httpStatusCode;
  Context? context;
  String? timestamp;

  CategoryResponseModel(
      {this.responseCode, this.httpStatusCode, this.context, this.timestamp});

  CategoryResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<Success>? success;

  Context({this.success});

  Context.fromJson(Map<String, dynamic> json) {
    if (json['success'] != null) {
      success = <Success>[];
      json['success'].forEach((v) {
        success!.add(Success.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (success != null) {
      data['success'] = success!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Success {
  int? id;
  int? parent;
  String? name;
  String? slug;
  String? icon;
  String? content;
  String? type;
  String? title;
  String? keywords;
  String? description;
  bool? isActive;
  bool? status;
  String? createdAt;
  String? picture;

  Success(
      {this.id,
        this.parent,
        this.name,
        this.slug,
        this.icon,
        this.content,
        this.type,
        this.title,
        this.keywords,
        this.description,
        this.isActive,
        this.status,
        this.createdAt,
        this.picture});

  Success.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parent = json['parent'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    content = json['content'];
    type = json['type'];
    title = json['title'];
    keywords = json['keywords'];
    description = json['description'];
    isActive = json['is_active'];
    status = json['status'];
    createdAt = json['created_at'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent'] = parent;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['content'] = content;
    data['type'] = type;
    data['title'] = title;
    data['keywords'] = keywords;
    data['description'] = description;
    data['is_active'] = isActive;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['picture'] = picture;
    return data;
  }
}
