class CommonPaginationQuery {
  CommonPaginationQuery({
    this.page = 1,
    this.limit = 13,
  });

  int? page;
  int? limit;
  int? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['limit'] = 20;
    return map;
  }
}
