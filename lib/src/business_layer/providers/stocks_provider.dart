import 'package:dio/src/form_data.dart';
import 'package:green_spark_vendor/src/business_layer/localization/translations.dart';
import 'package:green_spark_vendor/src/business_layer/network/http_response_code.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/providers/base_provider.dart';
import 'package:green_spark_vendor/src/business_layer/repository/catalogue_repository.dart';
import 'package:green_spark_vendor/src/business_layer/repository/stocks_repository.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/add_attribute_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/add_attribute_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/all_attribute_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/all_product_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/category_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/stocks_model/stocks_with_variant_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/stocks_model/stocks_without_variant_response_model.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/catalogue_screens/add_attribute.dart';

class StocksProvider extends BaseProvider {

  final StocksRepository _repository = StocksRepository();
  StocksWithoutVariantResponseModel? stocksWithoutVariantResponseModel;
  StocksWithVariantResponseModel? stocksWithVariantResponseModel;

  Future<String?> getStocksWithoutVariant() async {
    if (await checkInternet()) {
      var response = await _repository.getStocksWithoutVariant();
      if (response is StocksWithoutVariantResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          stocksWithoutVariantResponseModel = response;
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

  Future<String?> addStocksWithoutVariant(FormData formData) async {
    if (await checkInternet()) {
      var response = await _repository.addStocksWithoutVariant(formData);
      if (response is StocksWithoutVariantResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          stocksWithoutVariantResponseModel = response;
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

  Future<String?> addStocksWithVariant(FormData formData) async {
    if (await checkInternet()) {
      var response = await _repository.addStocksWithVariant(formData);
      if (response is StocksWithoutVariantResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          stocksWithoutVariantResponseModel = response;
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

  Future<String?> getStocksWithVariant() async {
    if (await checkInternet()) {
      var response = await _repository.getStocksWithVariant();
      if (response is StocksWithVariantResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          stocksWithVariantResponseModel = response;
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