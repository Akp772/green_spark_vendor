class StocksWithVariantResponseModel {
  int? httpStatusCode;
  bool? status;
  Context? context;
  String? timestamp;
  String? message;

  StocksWithVariantResponseModel(
      {this.httpStatusCode,
        this.status,
        this.context,
        this.timestamp,
        this.message});

  StocksWithVariantResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<WithvariantData>? data;

  Context({this.data});

  Context.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <WithvariantData>[];
      json['data'].forEach((v) {
        data!.add(WithvariantData.fromJson(v));
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

class WithvariantData {
  int? id;
  String? inventoryWithVariantId;
  String? attrId;
  String? attrValueId;
  String? sku;
  String? stockQuantity;
  String? purchasePrice;
  String? price;
  String? offerPrice;
  String? imageVariant;
  String? createdAt;
  String? updatedAt;
  InventoryWithVariant? inventoryWithVariant;

  WithvariantData(
      {this.id,
        this.inventoryWithVariantId,
        this.attrId,
        this.attrValueId,
        this.sku,
        this.stockQuantity,
        this.purchasePrice,
        this.price,
        this.offerPrice,
        this.imageVariant,
        this.createdAt,
        this.updatedAt,
        this.inventoryWithVariant});

  WithvariantData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inventoryWithVariantId = json['inventory_with_variant_id'];
    attrId = json['attr_id'];
    attrValueId = json['attr_value_id'];
    sku = json['sku'];
    stockQuantity = json['stock_quantity'];
    purchasePrice = json['purchase_price'];
    price = json['price'];
    offerPrice = json['offer_price'];
    imageVariant = json['image_variant'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inventoryWithVariant = json['inventory_with_variant'] != null
        ? InventoryWithVariant.fromJson(json['inventory_with_variant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['inventory_with_variant_id'] = inventoryWithVariantId;
    data['attr_id'] = attrId;
    data['attr_value_id'] = attrValueId;
    data['sku'] = sku;
    data['stock_quantity'] = stockQuantity;
    data['purchase_price'] = purchasePrice;
    data['price'] = price;
    data['offer_price'] = offerPrice;
    data['image_variant'] = imageVariant;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (inventoryWithVariant != null) {
      data['inventory_with_variant'] = inventoryWithVariant!.toJson();
    }
    return data;
  }
}

class InventoryWithVariant {
  int? id;
  String? title;
  String? pId;
  String? status;
  String? description;
  String? slug;
  String? metaTitle;
  String? metaDescription;
  String? createdBy;
  String? updatedBy;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  Product? product;

  InventoryWithVariant(
      {this.id,
        this.title,
        this.pId,
        this.status,
        this.description,
        this.slug,
        this.metaTitle,
        this.metaDescription,
        this.createdBy,
        this.updatedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.product});

  InventoryWithVariant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    pId = json['p_id'];
    status = json['status'];
    description = json['description'];
    slug = json['slug'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['p_id'] = pId;
    data['status'] = status;
    data['description'] = description;
    data['slug'] = slug;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
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

  Product(
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

  Product.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
