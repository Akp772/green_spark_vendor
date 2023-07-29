class RefreshTokenRequest {
  String? refreshtoken;

  RefreshTokenRequest({this.refreshtoken});

  RefreshTokenRequest.fromJson(Map<String, dynamic> json) {
    refreshtoken = json['refreshtoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshtoken'] = this.refreshtoken;
    return data;
  }
}
