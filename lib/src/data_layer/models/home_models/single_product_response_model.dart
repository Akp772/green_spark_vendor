class SingleProductResponseModel {
  String? responseCode;
  int? httpStatusCode;
  Context? context;
  String? timestamp;

  SingleProductResponseModel(
      {this.responseCode, this.httpStatusCode, this.context, this.timestamp});

  SingleProductResponseModel.fromJson(Map<String, dynamic> json) {
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

  Context({this.success});

  Context.fromJson(Map<String, dynamic> json) {
    success =
    json['success'] != null ? Success.fromJson(json['success']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (success != null) {
      data['success'] = success!.toJson();
    }
    return data;
  }
}

class Success {
  int? id;
  String? title;
  String? description;
  String? price;
  bool? isNegotiable;
  bool? status;
  String? youtubeLink;
  String? createdAt;
  List<String>? pictures;
  int? noOfViews;
  Location? location;
  MembershipPackage? membershipPackage;
  Category? category;
  List<String>? customFields;
  String? createdAtNaturaltime;
  String? createdAtNaturalday;
  User? user;

  Success(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.isNegotiable,
        this.status,
        this.youtubeLink,
        this.createdAt,
        this.pictures,
        this.noOfViews,
        this.location,
        this.membershipPackage,
        this.category,
        this.customFields,
        this.createdAtNaturaltime,
        this.createdAtNaturalday,
        this.user});

  Success.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    isNegotiable = json['is_negotiable'];
    status = json['status'];
    youtubeLink = json['youtube_link'];
    createdAt = json['created_at'];
    pictures = json['pictures'].cast<String>();
    noOfViews = json['no_of_views'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    membershipPackage = json['membership_package'] != null
        ? MembershipPackage.fromJson(json['membership_package'])
        : null;
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    customFields = json['custom_fields'].cast<String>();
    createdAtNaturaltime = json['created_at_naturaltime'];
    createdAtNaturalday = json['created_at_naturalday'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['is_negotiable'] = isNegotiable;
    data['status'] = status;
    data['youtube_link'] = youtubeLink;
    data['created_at'] = createdAt;
    data['pictures'] = pictures;
    data['no_of_views'] = noOfViews;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (membershipPackage != null) {
      data['membership_package'] = membershipPackage!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['custom_fields'] = customFields;
    data['created_at_naturaltime'] = createdAtNaturaltime;
    data['created_at_naturalday'] = createdAtNaturalday;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Location {
  int? id;
  String? locationName;

  Location({this.id, this.locationName});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationName = json['location_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['location_name'] = locationName;
    return data;
  }
}

class MembershipPackage {
  String? packageName;
  String? price;
  int? duration;
  String? description;

  MembershipPackage(
      {this.packageName, this.price, this.duration, this.description});

  MembershipPackage.fromJson(Map<String, dynamic> json) {
    packageName = json['package_name'];
    price = json['price'];
    duration = json['duration'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['package_name'] = packageName;
    data['price'] = price;
    data['duration'] = duration;
    data['description'] = description;
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? profilePic;

  User({this.id, this.fullName, this.profilePic});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['profile_pic'] = profilePic;
    return data;
  }
}
