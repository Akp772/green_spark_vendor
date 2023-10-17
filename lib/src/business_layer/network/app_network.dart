import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/network/api_constants.dart';
import 'package:green_spark_vendor/src/business_layer/network/http_response_code.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/flavor_configuration_helper.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/log_helper.dart';
import 'package:green_spark_vendor/src/data_layer/local_db/user_state_hive_helper.dart';
import 'package:green_spark_vendor/src/data_layer/models/base_api_response_model.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/splash_screen/splash_screen.dart';

class AppNetwork {
  static AppNetwork? _instance;

  static final String _baseUrl = FlavorConfig.instance.values.baseUrl;
  static final String _apiKey = FlavorConfig.instance.values.apiKey;
  bool _isSessionExpire = false;
  int refreshTokenCall = 0;

  Dio? _dioClient;

  /// Internal method to create instance of [AppNetwork] class
  AppNetwork._create() {
    _dioClient = Dio();
    (_dioClient!.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dioClient!.options.baseUrl = _baseUrl;
    _dioClient!.options.responseType = ResponseType.json;
    _dioClient!.options.sendTimeout = const Duration(seconds: 30);
    _dioClient!.options.connectTimeout = const Duration(seconds: 30);
    _dioClient!.options.receiveTimeout = const Duration(seconds: 30);
  }

  /// Factory constructor to get instance of [AppNetwork]
  factory AppNetwork() {
    return _instance ??= AppNetwork._create();
  }

  final String _debug = "[Debug]";
  final String _postData = " Post Data";
  final String _paramData = " Param Data";
  final String _keyAuth = 'Authorization';
  final String _deviceId = 'device_id';
  final String _local = 'local';
  final String _keyApi = 'x-api-key';

  /// Entry point method for all network request calls,this method gets data
  /// from network and send it back to caller
  Future<BaseApiResponseModel> request({
    required String url,
    dynamic request,
    Map<String, dynamic>? queryParameter,
    final String? requestType,
    bool? headerIncluded = true,
    String? token,
    Function? fileUploadProgress,
    bool isMultipartEnabled = false,
    bool isCheckUnauthorizedAccess = true,
  }) async {
    try {
      LogHelper.logData(_dioClient!.options.baseUrl + url);
      if (request != null && !isMultipartEnabled) {
        LogHelper.logData("$_debug$_postData ${jsonEncode(request)}");
      }
      if (request != null && isMultipartEnabled) {
        LogHelper.logData("$_debug$_postData ${jsonEncode(request)}");
      }
      if (queryParameter != null) {
        LogHelper.logData("$_debug$_paramData $queryParameter");
      }
      String? accessToken = await UserStateHiveHelper.instance.getAccessToken();

      var options = Options(method: requestType);
      if ((headerIncluded != null && headerIncluded)) {
        LogHelper.logData("$_keyAuth => token $accessToken");
        if(await UserStateHiveHelper.instance.isLoggedIn()) {
          options.headers = {
            _keyAuth: 'Bearer $accessToken',
            "client-key":"pPHWO0BO2LSpG3iscTBDEmIZWbyviojEEKpOgh3W",
            "client-id": "996c0ca1-bbe1-436f-a7bf-92da87c9d507"
          };
        }else {
          options.headers = {
            "client-key": "pPHWO0BO2LSpG3iscTBDEmIZWbyviojEEKpOgh3W",
            "client-id": "996c0ca1-bbe1-436f-a7bf-92da87c9d507"
          };
        }
        // options.headers = {
        //   _keyAuth: 'token $accessToken',
        //   // _deviceId: "fdf",
        //   // _local: "en"
        // };
      }
      if (isMultipartEnabled) {
        options.contentType = "multipart/form-data";
      } else {
        options.contentType = "application/json";
      }

      Response serverResponse = await _dioClient!.request(
        url,
        data: await request,
        queryParameters: queryParameter ?? {},
        options: options,
        onSendProgress: (int sent, int total) {
          LogHelper.logData("${sent / total * 100} total sent");
          if (fileUploadProgress != null) {
            fileUploadProgress(sent / total * 100);
          }
        },
      );

      switch (serverResponse.statusCode) {
        case HttpResponseCode.internalServerError:
          return BaseApiResponseModel(
              exceptionType: ExceptionType.apiException);

        default:
          return BaseApiResponseModel(
            data: serverResponse,
            exceptionType: ExceptionType.noException,
          );
      }
    } catch (e) {
      print("hello");
      return _requestCatchBloc(e, isCheckUnauthorizedAccess, url);
    }
  }

  /// Method used to handle caught errors
  BaseApiResponseModel _requestCatchBloc(
      Object error, bool isCheckUnauthorizedAccess, String path) {
    if (error is TimeoutException) {
      LogHelper.logError('Timeout Exception ====> $path, ${error.toString()}');
      return BaseApiResponseModel(
          exceptionType: ExceptionType.timeOutException);
    } else if (error is SocketException) {
      LogHelper.logError('Socket Exception ====> $path, ${error.toString()}');
      return BaseApiResponseModel(exceptionType: ExceptionType.socketException);
    } else if (error is DioError) {
      return _handleDioError(error, isCheckUnauthorizedAccess);
    } else {
      LogHelper.logError('Other Exception ====> $path, ${error.toString()}');
      return BaseApiResponseModel(exceptionType: ExceptionType.otherException);
    }
  }

  /// Method used to checks for all the dio errors
  BaseApiResponseModel _handleDioError(
      final DioError error, bool isCheckUnauthorizedAccess) {
    switch (error.type) {
      case DioErrorType.cancel:
        LogHelper.logError("Request cancelled ====>${error.message}");
        return BaseApiResponseModel(
            exceptionType: ExceptionType.cancelException);
      case DioErrorType.connectionTimeout:
        LogHelper.logError(
            "Connection timeout ====> ${error.requestOptions.path}, ${error.message}}");
        return BaseApiResponseModel(
            exceptionType: ExceptionType.timeOutException);
      case DioErrorType.connectionError:
        LogHelper.logError(
            "Other Error ====> ${error.requestOptions.path}, ${error.message}");
        return BaseApiResponseModel(
            exceptionType: ExceptionType.socketException);
      case DioErrorType.receiveTimeout:
        LogHelper.logError(
            "Receive Timeout Error ====> ${error.requestOptions.path}, ${error.message}");
        return BaseApiResponseModel(
            exceptionType: ExceptionType.timeOutException);
      case DioErrorType.sendTimeout:
        LogHelper.logError(
            "Send Timeout Error ====> ${error.requestOptions.path}, ${error.message}");
        return BaseApiResponseModel(
            exceptionType: ExceptionType.timeOutException);
      case DioErrorType.badResponse:
        LogHelper.logError(
            "Api Error Response Message ====> ${error.requestOptions.path}, ${error.message}, ${error.response}");
        if (error.response?.statusCode == HttpResponseCode.unAuthorized ||
            error.response?.statusCode == HttpResponseCode.forbidden) {
          // _sessionExpired(error);
          return BaseApiResponseModel(exceptionType: ExceptionType.noException);
        } else if (error.response?.statusCode ==
            HttpResponseCode.internalServerError) {
          return BaseApiResponseModel(
              exceptionType: ExceptionType.apiException);
        } else {
          return BaseApiResponseModel(
            data: error.response,
            exceptionType: ExceptionType.noException,
          );
        }
      default:
        LogHelper.logError(
            "Api Other Error ====> ${error.requestOptions.path}, ${error.message}");
        return BaseApiResponseModel(
            exceptionType: ExceptionType.otherException);
    }
  }

  /// Method used to open session expired dialog
  Future<void> _sessionExpired(DioError error) async {
    try {
      // FlutterToastHelper.showToast("Session Expire login again ! Called 401");
      // print("Session Expire login again ! Called 401");
      UserStateHiveHelper.instance.logOut();
      Navigator.pushAndRemoveUntil(navigatorKey.currentContext!,
          CupertinoPageRoute(builder: (_) => const SplashScreen()), (route) => false);
    } catch (e) {
      LogHelper.logError(e.toString());
    }
  }

  Future<void> refreshToken() async {
    UserStateHiveHelper.instance.getRefreshToken().then((refreshToken) async {
      print("============>old Refresh $refreshToken");
      final String apiUrl = _baseUrl + ApiConstant.refreshToken;
      try {
        Response response;
        response = await _dioClient!
            .post(apiUrl, data: {"refreshtoken": refreshToken});
        if (response.statusCode == 200) {
          _isSessionExpire = false;
          refreshTokenCall = 0;
          print(
              "============>Fresh Refresh ${response.data['data']['refresh_token']}");
          await UserStateHiveHelper.instance
              .setRefreshToken(response.data['data']['refresh_token']);
          await UserStateHiveHelper.instance
              .setAccessToken(response.data['data']['access_token']);
        } else {
          refreshTokenCall++;
          if (!_isSessionExpire && refreshTokenCall > 10) {
            _isSessionExpire = true;
            refreshTokenCall = 0;
            // FlutterToastHelper.showToast("Session Expire login again !");
            UserStateHiveHelper.instance.logOut();
            Navigator.pushAndRemoveUntil(
                navigatorKey.currentContext!,
                CupertinoPageRoute(builder: (_) => const SplashScreen()),
                (route) => false);
          }
          print("Refresh token expire ${response.toString()}"); //TODO: logout
        }
      } catch (e) {
        refreshTokenCall++;
        if (!_isSessionExpire && refreshTokenCall > 10) {
          _isSessionExpire = true;
          refreshTokenCall = 0;
          // FlutterToastHelper.showToast("Session Expire login again !");
          UserStateHiveHelper.instance.logOut();
          Navigator.pushAndRemoveUntil(
              navigatorKey.currentContext!,
              CupertinoPageRoute(builder: (_) => const SplashScreen()),
              (route) => false);
        }

        print("${refreshTokenCall} ${e.toString()}"); //TODO: logout
      }
    });
  }
}
