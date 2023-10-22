import 'package:green_spark_vendor/src/business_layer/localization/translations.dart';
import 'package:green_spark_vendor/src/business_layer/network/http_response_code.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/providers/base_provider.dart';
import 'package:green_spark_vendor/src/business_layer/repository/coupons_repository.dart';
import 'package:green_spark_vendor/src/business_layer/repository/home_repository.dart';
import 'package:green_spark_vendor/src/data_layer/models/base_api_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/coupon_models/add_coupon_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/coupon_models/add_coupons_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/coupon_models/coupons_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/all_product_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/category_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/single_product_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/trading_list_response_model.dart';

class CouponsProvider extends BaseProvider{

  final CouponsRepository _couponsRepository = CouponsRepository();
  CategoryResponseModel? categoryResponseModel;
  TradingResponseModel? tradingResponseModel;
  AddCouponResponseModel? addCouponResponseModel;
  AllCouponResponseModel? allCouponResponseModel;

  Future<String?> getAllCoupons() async {
    if (await checkInternet()) {
      var response = await _couponsRepository.getAllCoupons();
      if (response is AllCouponResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          allCouponResponseModel = response;
          notifyListeners();
          return HttpResponseType.success;
        }else{
          return "Something went wrong";
        }
      } else {
        return getExceptionMessage(exceptionType: response.exceptionType);
      }
    } else {
      return AppLocalizations.current.getSocketExceptionMessage;
    }
  }

  Future<String?> addCoupons(AddCouponRequestModel setRequest,int? id) async {
    if (await checkInternet()) {
      var response = await _couponsRepository.addCoupons(setRequest,id);
      if (response is AddCouponResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          return HttpResponseType.success;
        }else{
          return response.message??"";
        }
      } else {
        if(response is ApiResponseModel) {
          return getExceptionMessage(exceptionType: response.exceptionType);
        }else{
          return "Something went wrong";
        }
      }
    } else {
      return AppLocalizations.current.getSocketExceptionMessage;
    }
  }


}