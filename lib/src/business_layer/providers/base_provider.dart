import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/localization/translations.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/internet_helper.dart';
import 'package:green_spark_vendor/src/data_layer/local_db/user_state_hive_helper.dart';

class BaseProvider extends ChangeNotifier {
  late bool isLogin = true;

  /// check isLogin
  void checkLogin() async {
    isLogin = await UserStateHiveHelper.instance.isLoggedIn();
    print("LOGIN===>$isLogin");
    notifyListeners();
  }

  /* Function to check internet connection */
  Future<bool> checkInternet() async {
    return await NetworkConnection.instance.checkInternetConnection();
  }

  /// Function used to get exception messages
  String getExceptionMessage({required ExceptionType exceptionType}) {
    switch (exceptionType) {
      case ExceptionType.apiException:
        return AppLocalizations.current.getApiExceptionMessage;
      case ExceptionType.timeOutException:
        return AppLocalizations.current.getTimeoutExceptionMessage;
      case ExceptionType.socketException:
        return AppLocalizations.current.getSocketExceptionMessage;
      case ExceptionType.parseException:
        return AppLocalizations.current.getParseExceptionMessage;
      case ExceptionType.noException:
        return AppLocalizations.current.getEmptyString;
      case ExceptionType.cancelException:
        // TODO: Handle this case.
        break;
      case ExceptionType.otherException:
        AppLocalizations.current.getSocketExceptionMessage;
        break;

      default:
        return AppLocalizations.current.getApiExceptionMessage;
    }
    return AppLocalizations.current.getApiExceptionMessage;
  }

  void logout() {
    UserStateHiveHelper.instance.logOut();
  }
}
