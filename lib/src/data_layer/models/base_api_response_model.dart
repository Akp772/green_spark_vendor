
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';

class BaseApiResponseModel {
  BaseApiResponseModel(
      {this.exceptionType = ExceptionType.noException, this.data});
  ExceptionType exceptionType;
  dynamic data;
}

class ApiResponseModel<T> {
  bool? status;
  String? message;
  int? statusCode;
  T? data;
  ExceptionType exceptionType;
  ApiResponseModel(
      {this.status,
        this.message,
        this.statusCode,
        this.data,
        this.exceptionType = ExceptionType.noException});

  factory ApiResponseModel.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return ApiResponseModel<T>(
      status: json["success"],
      message: json["message"],
      statusCode: json["status_code"],
      data: create(json["result"]),
    );
  }
}

class EmptyDataResponseModel {
  EmptyDataResponseModel();

  EmptyDataResponseModel.fromJson(Map<String, dynamic> json);
}
