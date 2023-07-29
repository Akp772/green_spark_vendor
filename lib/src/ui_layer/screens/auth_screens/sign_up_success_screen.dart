import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/sign_in_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class SignUPSuccessScreen extends StatefulWidget {
  const SignUPSuccessScreen({Key? key}) : super(key: key);

  @override
  State<SignUPSuccessScreen> createState() => _SignUPSuccessScreenState();
}

class _SignUPSuccessScreenState extends State<SignUPSuccessScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWidget(),
    );
  }

  Widget _mainWidget(){
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SafeArea(
        child: Padding(
          padding: AppStyles.pd20,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppStyles.sbHeight40,
                AppImages.redAppLogo,
                AppStyles.sbHeight40,
                const PoppinsMediumText(text: "Thank You For Registering With Us", fontSize: 18,color: AppColors.textColor,),
                AppStyles.sbHeight40,
                AppImages.tickIcon,
                AppStyles.sbHeight30,
                const PoppinsMediumText(text: "Your Account Has Been Successfully Verified", fontSize: 16,color: AppColors.textColor,textAlign: TextAlign.center,height: 1.5,),
                AppStyles.sbHeight60,
                CommonAppButton(text: "Sign In", onTap: (){
                  navigatorKey.currentState!.pop();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
