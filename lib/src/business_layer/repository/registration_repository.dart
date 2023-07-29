import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:green_spark_vendor/src/business_layer/network/api_constants.dart';
import 'package:green_spark_vendor/src/business_layer/network/app_network.dart';
import 'package:green_spark_vendor/src/business_layer/network/http_response_code.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/log_helper.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/change_password_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/forgot_password_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/forgot_password_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/login_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/send_otp_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/sign_up_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/sign_up_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/verify_otp_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/verify_otp_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/base_api_response_model.dart';

class RegistrationRepository {
  final String _tag = "HomeRepository: ";
  Map<String, dynamic>? _responseBody;

  /// login api
  Future<dynamic> login(
      String? userId,String password,
      ) async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.signIn,
        requestType: HttpRequestMethods.post,
        request: {
          "user_id": userId,
          "password": password
        },
        headerIncluded: false,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode(utf8.decode(response.data.toString().runes.toList()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return LoginResponseModel.fromJson(_responseBody!);
        // });
      } else {
        return ApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return ApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }


  Future<dynamic> forgotPassword(
      ForgotPasswordRequestModel userData
      ) async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.forgotPassword,
        requestType: HttpRequestMethods.post,
        request: userData,
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode(utf8.decode(response.data.toString().runes.toList()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return ForgotPasswordResponseModel.fromJson(_responseBody!);
        // });
      } else {
        return ApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return ApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }

  Future<dynamic> changePassword(
      ChangePasswordRequestModel userData
      ) async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.changePassword,
        requestType: HttpRequestMethods.post,
        request: userData,
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode(utf8.decode(response.data.toString().runes.toList()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return ForgotPasswordResponseModel.fromJson(_responseBody!);
        // });
      } else {
        return ApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return ApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }


  Future<dynamic> signUp(
  {required String email,required String password,required String mobileNumber}
      ) async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.signUp,
        requestType: HttpRequestMethods.post,
        request: mobileNumber.isEmpty ? {
          "email": email,
          "password": password
        } : {
          "email": email,
          "password": password,
          "phone_no": mobileNumber
        },
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode(utf8.decode(response.data.toString().runes.toList()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return SignUpResponseModel.fromJson(_responseBody!);
            // });
      } else {
        return ApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return ApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }

  Future<dynamic> verifyOTP(
      VerifyOTPRequestModel? userData,
      ) async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.verifyOtp,
        requestType: HttpRequestMethods.post,
        request: userData,
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode(utf8.decode(response.data.toString().runes.toList()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return VerifyOTPResponseModel.fromJson(_responseBody!);
        // });
      } else {
        return ApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return ApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }


  Future<dynamic> sendOTP(String type,String email
      ) async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.sendOTP,
        requestType: HttpRequestMethods.post,
        request: {
          "otp_type": type,
          "email": email
        },
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode(utf8.decode(response.data.toString().runes.toList()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return SendOTPResponseModel.fromJson(_responseBody!);
        // });
      } else {
        return ApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return ApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }


}
