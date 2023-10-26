import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/src/form_data.dart';
import 'package:green_spark_vendor/src/business_layer/network/api_constants.dart';
import 'package:green_spark_vendor/src/business_layer/network/app_network.dart';
import 'package:green_spark_vendor/src/business_layer/network/http_response_code.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/log_helper.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/login_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/base_api_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/add_attribute_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/add_attribute_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/all_attribute_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/all_product_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/category_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/single_product_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/trading_list_response_model.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/catalogue_screens/add_attribute.dart';

class CatalogueRepository {
  final String _tag = "CatalogueRepository: ";
  Map<String, dynamic>? _responseBody;

  /// get all category
  Future<dynamic> getAllProducts() async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.getAllCatalogueProducts,
        requestType: HttpRequestMethods.post,
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode((response.data.toString()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return AllProductsResponseModel.fromJson(_responseBody!);
        // });
      } else {
        return ApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return ApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }

  Future<dynamic> getAllAttribute() async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.getAllAttribute,
        requestType: HttpRequestMethods.get,
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode((response.data.toString()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return AllAttributeResponseModel.fromJson(_responseBody!);
        // });
      } else {
        return ApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return ApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }

  Future<dynamic> addProducts(FormData formData) async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.addProduct,
        requestType: HttpRequestMethods.post,
        request: formData,
        isMultipartEnabled: true,
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode((response.data.toString()));
        return AddAttributeResponseModel.fromJson(_responseBody!);
        // });
      } else {
        return ApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return ApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }

  Future<dynamic> addAllAttribute(AddAttributeRequestModel value) async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.addAllAttribute,
        requestType: HttpRequestMethods.post,
        request: value,
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode((response.data.toString()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return AddAttributeResponseModel.fromJson(_responseBody!);
        // });
      } else {
        return ApiResponseModel(exceptionType: response.exceptionType);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return ApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }

  Future<dynamic> deleteAllAttribute(AddAttributeRequestModel value) async {
    try {
      BaseApiResponseModel response = await AppNetwork().request(
        url: ApiConstant.addAllAttribute,
        requestType: HttpRequestMethods.post,
        request: value,
        headerIncluded: true,
      );

      LogHelper.logData(_tag + response.data.toString());
      if (response.data != null) {
        _responseBody =
            jsonDecode((response.data.toString()));
        // return ApiResponseModel<EmptyDataResponseModel>.fromJson(_responseBody!,
        //         (data) {
        return AddAttributeResponseModel.fromJson(_responseBody!);
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
