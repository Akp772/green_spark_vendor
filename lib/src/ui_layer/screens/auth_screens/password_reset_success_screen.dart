import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/regex.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/sign_up_type_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class PasswordResetSuccessScreen extends StatelessWidget {
  const PasswordResetSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return SafeArea(
        child: Padding(
          padding: AppStyles.pd20,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppStyles.sbHeight30,
                AppImages.redAppLogo,
                AppStyles.sbHeight60,
                 AppStyles.sbHeight40,
                _successWidget(),
                AppStyles.sbHeight20,
              ],
            ),
          ),
        )
    );
  }

  Widget _successWidget(){
    return Container(
      padding: AppStyles.pd20,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textColor,width: 1)
      ),
      child:Column(
        children: [
          Container(
            height: 50,width: 50,
            padding: AppStyles.pd10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.greenColor
            ),
            child: Container(
                padding: AppStyles.pd5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.whiteColor
                ),
                child: AppImages.rightTickIcon),
          ),
          AppStyles.sbHeight15,
          const PoppinsSemiBoldText(text: "Password Successfully Reset", fontSize: 16,color: AppColors.textColor,),
          AppStyles.sbHeight15,
          const SubTitleText(text: "Your Password Has Been Reset Successfully",fontSize: 14,color: AppColors.textColor,),
          AppStyles.sbHeight30,
          CommonAppButton(text: "Sign In", onTap: (){
            navigatorKey.currentState!.pop();
            navigatorKey.currentState!.pop();
          })
        ],
      )
    );
  }


}
