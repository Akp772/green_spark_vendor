import 'package:green_spark_vendor/src/business_layer/localization/translations.dart';
import 'package:green_spark_vendor/src/business_layer/network/http_response_code.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/providers/base_provider.dart';
import 'package:green_spark_vendor/src/business_layer/repository/home_repository.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/all_product_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/category_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/single_product_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/trading_list_response_model.dart';

class HomeProvider extends BaseProvider{

  final HomeRepository _homeRepository = HomeRepository();
  CategoryResponseModel? categoryResponseModel;
  TradingResponseModel? tradingResponseModel;
  ProductsListingResponseModel? productsListingResponseModel;
  SingleProductResponseModel? singleProductResponseModel;

  Future<String?> getAllCategory() async {
    if (await checkInternet()) {
      var response = await _homeRepository.getAllCategory();
      if (response is CategoryResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          categoryResponseModel = response;
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

  Future<String?> getSingleProductDetails(id) async {
    if (await checkInternet()) {
      var response = await _homeRepository.getSingleProductDetails(id);
      if (response is SingleProductResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          singleProductResponseModel = response;
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

  Future<String?> getAllTrading() async {
    if (await checkInternet()) {
      var response = await _homeRepository.getAllTrading();
      if (response is TradingResponseModel) {
        if(true) {
          tradingResponseModel = response;
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

  Future<String?> getAllProducts() async {
    if (await checkInternet()) {
      var response = await _homeRepository.getAllProducts();
      if (response is ProductsListingResponseModel) {
        if(true) {
          productsListingResponseModel = response;
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
}