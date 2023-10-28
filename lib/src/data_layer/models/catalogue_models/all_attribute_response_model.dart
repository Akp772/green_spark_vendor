class AllAttributeResponseModel {
  int? httpStatusCode;
  bool? status;
  Context? context;
  String? timestamp;
  String? message;

  AllAttributeResponseModel(
      {this.httpStatusCode,
        this.status,
        this.context,
        this.timestamp,
        this.message});

  AllAttributeResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<AttributeData>? data;

  Context({this.data});

  Context.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AttributeData>[];
      json['data'].forEach((v) {
        data!.add(AttributeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttributeData {
  int? id;
  String? attributeType;
  String? attributeName;
  String? listOrder;
  String? status;
  String? createdBy;
  String? updatedBy;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  List<Categories>? categories;
  List<AttributeValues>? attributeValues;

  AttributeData(
      {this.id,
        this.attributeType,
        this.attributeName,
        this.listOrder,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.categories,
        this.attributeValues});

  AttributeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeType = json['attribute_type'];
    attributeName = json['attribute_name'];
    listOrder = json['list_order'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['attribute_values'] != null) {
      attributeValues = <AttributeValues>[];
      json['attribute_values'].forEach((v) {
        attributeValues!.add(AttributeValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['attribute_type'] = attributeType;
    data['attribute_name'] = attributeName;
    data['list_order'] = listOrder;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (attributeValues != null) {
      data['attribute_values'] =
          attributeValues!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? categoryName;
  String? parentCategoryId;
  String? status;
  String? image;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Categories(
      {this.id,
        this.categoryName,
        this.parentCategoryId,
        this.status,
        this.image,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    parentCategoryId = json['parent_category_id'];
    status = json['status'];
    image = json['image'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['category_name'] = categoryName;
    data['parent_category_id'] = parentCategoryId;
    data['status'] = status;
    data['image'] = image;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? attributeId;
  String? categoryId;

  Pivot({this.attributeId, this.categoryId});

  Pivot.fromJson(Map<String, dynamic> json) {
    attributeId = json['attribute_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['attribute_id'] = attributeId;
    data['category_id'] = categoryId;
    return data;
  }
}

class AttributeValues {
  int? id;
  String? attributeId;
  String? attributeValue;
  String? valueListOrder;
  String? status;
  String? createdBy;
  String? updatedBy;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? colorAttribute;

  AttributeValues(
      {this.id,
        this.attributeId,
        this.attributeValue,
        this.valueListOrder,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.colorAttribute});

  AttributeValues.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeId = json['attribute_id'];
    attributeValue = json['attribute_value'];
    valueListOrder = json['value_list_order'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    colorAttribute = json['color_attribute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['attribute_id'] = attributeId;
    data['attribute_value'] = attributeValue;
    data['value_list_order'] = valueListOrder;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['color_attribute'] = colorAttribute;
    return data;
  }
}
