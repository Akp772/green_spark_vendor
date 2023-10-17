class AllProductsResponseModel {
  int? httpStatusCode;
  bool? status;
  Context? context;
  String? timestamp;
  String? message;

  AllProductsResponseModel(
      {this.httpStatusCode,
        this.status,
        this.context,
        this.timestamp,
        this.message});

  AllProductsResponseModel.fromJson(Map<String, dynamic> json) {
    httpStatusCode = json['http_status_code'];
    status = json['status'];
    context =
    json['context'] != null ? new Context.fromJson(json['context']) : null;
    timestamp = json['timestamp'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  List<Data>? data;

  Context({this.data});

  Context.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? status;
  String? description;
  String? galleryImages;
  String? featuredImage;
  String? requiresShipping;
  String? hasVariant;
  String? brand;
  String? modelNumber;
  String? slug;
  String? tags;
  String? minOrderQty;
  String? weight;
  String? dimensions;
  String? keyFeatures;
  String? linkedItems;
  String? metaTitle;
  String? metaDescription;
  String? createdBy;
  String? updatedBy;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.status,
        this.description,
        this.galleryImages,
        this.featuredImage,
        this.requiresShipping,
        this.hasVariant,
        this.brand,
        this.modelNumber,
        this.slug,
        this.tags,
        this.minOrderQty,
        this.weight,
        this.dimensions,
        this.keyFeatures,
        this.linkedItems,
        this.metaTitle,
        this.metaDescription,
        this.createdBy,
        this.updatedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    description = json['description'];
    galleryImages = json['gallery_images'];
    featuredImage = json['featured_image'];
    requiresShipping = json['requires_shipping'];
    hasVariant = json['has_variant'];
    brand = json['brand'];
    modelNumber = json['model_number'];
    slug = json['slug'];
    tags = json['tags'];
    minOrderQty = json['min_order_qty'];
    weight = json['weight'];
    dimensions = json['dimensions'];
    keyFeatures = json['key_features'];
    linkedItems = json['linked_items'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['description'] = description;
    data['gallery_images'] = galleryImages;
    data['featured_image'] = featuredImage;
    data['requires_shipping'] = requiresShipping;
    data['has_variant'] = hasVariant;
    data['brand'] = brand;
    data['model_number'] = modelNumber;
    data['slug'] = slug;
    data['tags'] = tags;
    data['min_order_qty'] = minOrderQty;
    data['weight'] = weight;
    data['dimensions'] = dimensions;
    data['key_features'] = keyFeatures;
    data['linked_items'] = linkedItems;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
