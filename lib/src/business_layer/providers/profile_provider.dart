import 'package:green_spark_vendor/src/business_layer/localization/translations.dart';
import 'package:green_spark_vendor/src/business_layer/network/http_response_code.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/providers/base_provider.dart';
import 'package:green_spark_vendor/src/business_layer/repository/profile_repository.dart';
import 'package:green_spark_vendor/src/data_layer/models/profile_models/get_profile_response_model.dart';

class ProfileProvider extends BaseProvider{

  final ProfileRepository _profileRepository = ProfileRepository();
  GetProfileResponseModel? getProfileResponseModel;

  Future<String?> getProfileDetails() async {
    if (await checkInternet()) {
      var response = await _profileRepository.getProfileDetails();
      if (response is GetProfileResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          getProfileResponseModel = response;
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