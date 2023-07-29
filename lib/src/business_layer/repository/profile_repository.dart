import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:green_spark_vendor/src/business_layer/network/api_constants.dart';
import 'package:green_spark_vendor/src/business_layer/network/app_network.dart';
import 'package:green_spark_vendor/src/business_layer/network/http_response_code.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/log_helper.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/login_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/base_api_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/all_product_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/category_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/single_product_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/trading_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/profile_models/get_profile_response_model.dart';

class ProfileRepository {
  final String _tag = "ProfileRepository: ";
  Map<String, dynamic>? _responseBody;

  /// get all category
  Future<dynamic> getProfileDetails() async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.getUserProfile,
        requestType: HttpRequestMethods.get,
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode((response.data.toString()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return GetProfileResponseModel.fromJson(_responseBody!);
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
