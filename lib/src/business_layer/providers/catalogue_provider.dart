import 'package:green_spark_vendor/src/business_layer/localization/translations.dart';
import 'package:green_spark_vendor/src/business_layer/network/http_response_code.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/providers/base_provider.dart';
import 'package:green_spark_vendor/src/business_layer/repository/catalogue_repository.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/add_attribute_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/add_attribute_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/all_attribute_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/all_product_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/category_list_response_model.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/catalogue_screens/add_attribute.dart';

class CatalogueProvider extends BaseProvider {

  final CatalogueRepository _catalogueRepository = CatalogueRepository();
  AllProductsResponseModel? allProductsResponseModel;
  AllAttributeResponseModel? allAttributeResponseModel;

  Future<String?> getAllProducts() async {
    if (await checkInternet()) {
      var response = await _catalogueRepository.getAllProducts();
      if (response is AllProductsResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          allProductsResponseModel = response;
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

  Future<String?> getAllAttribute() async {
    if (await checkInternet()) {
      var response = await _catalogueRepository.getAllAttribute();
      if (response is AllAttributeResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          allAttributeResponseModel = response;
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

  Future<String?> addAllAttribute(AddAttributeRequestModel value) async {
    if (await checkInternet()) {
      var response = await _catalogueRepository.addAllAttribute(value);
      if (response is AddAttributeResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          return HttpResponseType.success;
        }else{
          return response.message ?? "Something went wrong";
        }
      } else {
        return getExceptionMessage(exceptionType: response.exceptionType);
      }
    } else {
      return AppLocalizations.current.getSocketExceptionMessage;
    }
  }

  Future<String?> deleteAllAttribute(value) async {
    if (await checkInternet()) {
      var response = await _catalogueRepository.deleteAllAttribute(value);
      if (response is AddAttributeResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          return HttpResponseType.success;
        }else{
          return response.message ?? "Something went wrong";
        }
      } else {
        return getExceptionMessage(exceptionType: response.exceptionType);
      }
    } else {
      return AppLocalizations.current.getSocketExceptionMessage;
    }
  }


}