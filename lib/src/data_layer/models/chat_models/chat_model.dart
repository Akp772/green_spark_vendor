class ChatModel {
  String? sentFrom;
  int? time;
  String? message;
  bool? hasSeen;

  ChatModel(
      {required this.sentFrom,
        required this.time,
        required this.message,
        required this.hasSeen});

  ChatModel.fromJson(Map<String, dynamic> json) {
    sentFrom = json['sentFrom'];
    time = json['time'];
    message = json['message'];
    hasSeen = json['hasSeen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sentFrom'] = sentFrom;
    data['time'] = time;
    data['message'] = message;
    data['hasSeen'] = hasSeen;
    return data;
  }
}