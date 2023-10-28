class AddAttributeRequestModel {
  String? attributeType;
  String? name;
  String? order;
  List<int>? categories;

  AddAttributeRequestModel(
      {this.attributeType, this.name, this.order, this.categories});

  AddAttributeRequestModel.fromJson(Map<String, dynamic> json) {
    attributeType = json['attribute_type'];
    name = json['name'];
    order = json['order'];
    categories = json['categories'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attribute_type'] = attributeType;
    data['name'] = name;
    data['order'] = order;
    data['categories'] = categories;
    return data;
  }
}
