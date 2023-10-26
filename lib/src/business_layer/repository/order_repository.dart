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
import 'package:green_spark_vendor/src/data_layer/models/coupon_models/add_coupon_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/coupon_models/add_coupons_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/coupon_models/coupons_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/all_product_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/category_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/single_product_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/trading_list_response_model.dart';

class OrdersRepository {
  final String _tag = "OrdersRepository: ";
  Map<String, dynamic>? _responseBody;

  Future<dynamic> getAllOrders() async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.getOrders,
        requestType: HttpRequestMethods.get,
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode((response.data.toString()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return AllCouponResponseModel.fromJson(_responseBody!);
        // });
      } else {
        return ApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return ApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }

  Future<dynamic> addCoupons(AddCouponRequestModel setRequest, int? id, {int type = 0}) async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: id != null ? ApiConstant.editCoupon(id) :ApiConstant.addCoupon,
        requestType: HttpRequestMethods.post,
        request: setRequest,
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode((response.data.toString()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return AddCouponResponseModel.fromJson(_responseBody!);
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
