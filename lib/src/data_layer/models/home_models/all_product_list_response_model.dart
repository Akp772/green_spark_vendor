class ProductsListingResponseModel {
  Context? context;
  int? status;
  String? code;
  String? time;

  ProductsListingResponseModel(
      {this.context, this.status, this.code, this.time});

  ProductsListingResponseModel.fromJson(Map<String, dynamic> json) {
    context =
    json['context'] != null ? Context.fromJson(json['context']) : null;
    status = json['status'];
    code = json['code'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (context != null) {
      data['context'] = context!.toJson();
    }
    data['status'] = status;
    data['code'] = code;
    data['time'] = time;
    return data;
  }
}

class Context {
  Urls? urls;
  int? totalPage;
  List<Results>? results;

  Context({this.urls, this.totalPage, this.results});

  Context.fromJson(Map<String, dynamic> json) {
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    totalPage = json['total_page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (urls != null) {
      data['urls'] = urls!.toJson();
    }
    data['total_page'] = totalPage;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Urls {
  Null? next;
  Null? previous;

  Urls({this.next, this.previous});

  Urls.fromJson(Map<String, dynamic> json) {
    next = json['next'];
    previous = json['previous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['next'] = next;
    data['previous'] = previous;
    return data;
  }
}

class Results {
  int? id;
  String? title;
  String? description;
  String? price;
  bool? isNegotiable;
  String? youtubeLink;
  String? createdAt;
  List<String>? pictures;
  int? noOfViews;
  Location? location;
  MembershipPackage? membershipPackage;
  Category? category;
  String? createdAtNaturaltime;
  String? createdAtNaturalday;

  Results(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.isNegotiable,
        this.youtubeLink,
        this.createdAt,
        this.pictures,
        this.noOfViews,
        this.location,
        this.membershipPackage,
        this.category,
        this.createdAtNaturaltime,
        this.createdAtNaturalday});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    isNegotiable = json['is_negotiable'];
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
    createdAtNaturaltime = json['created_at_naturaltime'];
    createdAtNaturalday = json['created_at_naturalday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['is_negotiable'] = isNegotiable;
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
    data['created_at_naturaltime'] = createdAtNaturaltime;
    data['created_at_naturalday'] = createdAtNaturalday;
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
