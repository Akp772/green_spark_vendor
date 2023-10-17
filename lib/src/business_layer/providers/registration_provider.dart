import 'dart:io';

import 'package:green_spark_vendor/src/business_layer/localization/translations.dart';
import 'package:green_spark_vendor/src/business_layer/network/http_response_code.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/providers/base_provider.dart';
import 'package:green_spark_vendor/src/business_layer/repository/registration_repository.dart';
import 'package:green_spark_vendor/src/data_layer/local_db/user_state_hive_helper.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/SocialLoginRequestModel.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/change_password_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/forgot_password_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/forgot_password_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/login_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/send_otp_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/sign_up_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/sign_up_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/verify_otp_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/verify_otp_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/regex.dart';

class RegistrationProvider extends BaseProvider {
  final RegistrationRepository _registrationRepository = RegistrationRepository();
  final SignUpRequestModel _signUpRequestModel = SignUpRequestModel();

  /// Method used to validate mobile number text field
  String? validateMobileNumber(String mobile) {
    if (mobile.isEmpty) {
      return "";
    }
    if (int.parse(mobile.substring(0, 1)) >= 6 /*&& mobile.isNotEmpty*/ &&
        mobile.length == i_10) {
      return null;
    } else {
      return "";
    }
  }

  /// check that the text is email or mobile number
  int? checkEmailOrMobileNumber(String text) {
    if (text.isNotEmpty && AppRegex.emailRegex.hasMatch(text)) {
      return 0;
    } else if (text.isNotEmpty &&
        text.length == i_10 &&
        AppRegex.number.hasMatch(text)) {
      return 1;
    } else {
      return null;
    }
  }

  /// password validation method
  String? passwordValidation(String password) {
    if (password.isEmpty) {
      return "";
    } else if (password.isNotEmpty && !AppRegex.passwordValidation(password)) {
      return "";
    } else {
      return null;
    }
  }

  /// resend otp for verifyEmail
  Future<String?> signUp(SignUpRequestModel setRequest) async {
    if (await checkInternet()) {
      var response = await _registrationRepository.signUp(setRequest);
      if (response is SignUpResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          UserStateHiveHelper.instance.logIn();
          UserStateHiveHelper.instance.setAccessToken(response.context!.data!.token!);
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

  Future<String?> login({required String email,required String password}) async {
    if (await checkInternet()) {
      var response = await _registrationRepository.login(_setLoginRequest(email,password));
      if (response is LoginResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          UserStateHiveHelper.instance.logIn();
          UserStateHiveHelper.instance.setAccessToken(response.context!.data!.token!);
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

  SignInRequestModel _setLoginRequest(String userID,String password){
    SignInRequestModel signInRequestModel = SignInRequestModel()
        ..authProvider = ''
        ..deviceType = ''
        ..fcmToken = ''
        ..deviceType = Platform.isAndroid ? 'Android' : 'iOS'
        ..deviceId = ''
        ..userId = userID
        ..password = password;
    return signInRequestModel;
  }

  Future<String?> forgotPassword({required String email,required String password}) async {
    if (await checkInternet()) {
      var response = await _registrationRepository.forgotPassword(ForgotPasswordRequestModel(email: email,confirmPassword: password,password: password));
      if (response is ForgotPasswordResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          return HttpResponseType.success;
        }else{
          return response.context != null ? response.context!.message : "Something went wrong";
        }
      } else {
        return getExceptionMessage(exceptionType: response.exceptionType);
      }
    } else {
      return AppLocalizations.current.getSocketExceptionMessage;
    }
  }

  Future<String?> changePassword({required String currPassword,required String password}) async {
    if (await checkInternet()) {
      var response = await _registrationRepository.changePassword(ChangePasswordRequestModel(currentPassword: currPassword,newPassword: password,newPasswordConfirm: password));
      if (response is ForgotPasswordResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          return HttpResponseType.success;
        }else{
          return response.context != null ? response.context!.message : "Something went wrong";
        }
      } else {
        return getExceptionMessage(exceptionType: response.exceptionType);
      }
    } else {
      return AppLocalizations.current.getSocketExceptionMessage;
    }
  }

  Future<String?> verifyOTP({required String email,required String otp,String type="account__verify"}) async {
    if (await checkInternet()) {
      var response = await _registrationRepository.verifyOTP(VerifyOTPRequestModel(email: email,otp: otp,otpType: type));
      if (response is VerifyOTPResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.accepted) {
          return HttpResponseType.success;
        }else{
          return response.context != null ? response.context!.message : "Something went wrong";
        }
      } else {
        return getExceptionMessage(exceptionType: response.exceptionType);
      }
    } else {
      return AppLocalizations.current.getSocketExceptionMessage;
    }
  }

  Future<String?> sendOTP({required String email,required String type}) async {
    if (await checkInternet()) {
      var response = await _registrationRepository.sendOTP(type,email);
      if (response is SendOTPResponseModel) {
        if(response.httpStatusCode==HttpResponseCode.ok) {
          return HttpResponseType.success;
        }else if(response.httpStatusCode ==HttpResponseCode.unAuthorized ){
          return "User not found";
        }else{
          return response.context != null ? response.context!.message : "Something went wrong";
        }
      } else {
        return getExceptionMessage(exceptionType: response.exceptionType);
      }
    } else {
      return AppLocalizations.current.getSocketExceptionMessage;
    }
  }

}