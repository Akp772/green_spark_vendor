

import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/regex.dart';

class ValidationCheck {
  /// Method used to check email field validation
  static String? emailValidation(String? email) {
    if (email!.isEmpty) {
      return "Please enter email address.";
    } else if (email.isNotEmpty && !AppRegex.emailRegex.hasMatch(email)) {
      return "Please enter a valid email address.";
    } else {
      return null;
    }
  }

  /// Method used to check password field validation
  static String? passwordValidation(String? password) {
    if (password!.isEmpty) {
      return "Please enter password.";
    } else if (password.isNotEmpty &&
        !AppRegex.passwordRegex.hasMatch(password)) {
      return "Please enter a valid password.";
    } else {
      return null;
    }
  }

  /// Method used to check confirm password field validation
  static String? confirmPasswordValidation(String? password) {
    if (password!.isEmpty) {
      return "Please enter confirm password.";
    } else if (password.isNotEmpty &&
        !AppRegex.passwordRegex.hasMatch(password)) {
      return "Please enter a valid confirm password.";
    } else {
      return null;
    }
  }

  /// Method used to check Otp field validation
  static String? otpField(String? otp) {
    if (otp!.length < 4) {
      return "Please enter OTP.";
    }
    return null;
  }

  /// Method used to check new Password and confirm password must be same validation
  static String? newConfirmPasswordSame(
      String newPassword, String confirmPassword) {
    if (newPassword != confirmPassword) {
      return "New password and confirm password must be same.";
    } else {
      return null;
    }
  }

  /// Method used to check name field validation
  static String? nameValidation(String? name) {
    if (name!.length < 3) {
      return "Please enter first name.";
    } /* else if (name.isNotEmpty && !AppRegex.fullName.hasMatch(name)) {
      return "Please enter a valid first name.";
    }*/
    else {
      return null;
    }
  }

  /// Method used to check name field validation
  static String? lastNameValidation(String? name) {
    if (name!.length < 2) {
      return "Please enter last name.";
    } /* else if (name.isNotEmpty && !AppRegex.fullName.hasMatch(name)) {
      return "Please enter a valid last name.";
    }*/
    else {
      return null;
    }
  }

  /// Method used to check date of Birth field validation
  static String? dateOfBirthValidation(String? dateOfBirth) {
    if (dateOfBirth == null) {
      return "Please enter valid date of Birth.";
    } else {
      return null;
    }
  }

  /// Method used to validate mobile number text field
  static String? validateMobileNumber(String? mobile) {
    if (mobile!.isEmpty) {
      return "Please enter Mobile No.";
    }
    if (mobile.isNotEmpty && mobile.length < i_10) {
      return "Please enter a valid Mobile No.";
    } else {
      return null;
    }
  }

  /// Method used to validate post Details text field
  static String? validatePostTitle(String? title) {
    if (title!.isEmpty && title.length < i_3) {
      return "Please enter post title";
    } else {
      return null;
    }
  }

  static String? validatePostDescription(String? description) {
    if (description!.isEmpty && description.length < i_3) {
      return "Please enter post details";
    } else {
      return null;
    }
  }
}
