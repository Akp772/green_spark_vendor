import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/data_layer/local_db/user_state_hive_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class AppDialogs {
  /// dialog box for logout confirmation
  static Future showAlertDialogForLogOut() {
    return showDialog<void>(
        barrierColor: AppColors.blackTextColor.withOpacity(0.85),
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                decoration: AppStyles.radiusBoxDecoration(
                  radius: d_18,

                  ///color: AppColors.whiteColor
                ),
                child: Container(),
              ));
        });
  }

  /// dialog box for delete account confirmation in case of guest user
  static Future showAlertDialogForDeleteAccount(
      String headingText, String subText) {
    return showDialog<void>(
        barrierColor: AppColors.blackTextColor.withOpacity(0.85),
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                decoration: AppStyles.radiusBoxDecoration(
                  radius: d_18,

                  ///color: AppColors.whiteColor
                ),
              ));
        });
  }

  /// dialog box for
  static Future commonShowAlertDialog(
      {required String title, String? description, Widget? contentWidget}) {
    return showDialog<void>(
        barrierColor: AppColors.blackTextColor.withOpacity(0.85),
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: AppStyles.pd20,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: CommonText(
              text: title,
              fontSize: 24,
              textAlign: TextAlign.center,
            ),
            content: contentWidget,
          );
        });
  }

  static Future showAlertDialog({required Widget child}) {
    return showDialog<void>(
        barrierColor: AppColors.blackTextColor.withOpacity(0.85),
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                decoration: AppStyles.radiusBoxDecoration(
                  radius: d_18,
                  ///color: AppColors.whiteColor
                ),
                child: Wrap(
                  children: [
                    child,
                  ],
                ),
              ));
        });
  }

}
