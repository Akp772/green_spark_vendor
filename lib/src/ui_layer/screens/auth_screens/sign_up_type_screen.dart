import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/business_layer/util/social_login_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/sign_in_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/sign_up_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/app_common_appbar.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class SignInTypesScreen extends StatelessWidget {
   SignInTypesScreen({Key? key}) : super(key: key);

  final SocialLoginHelper socialLoginHelper = SocialLoginHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppImages.backIcon,
        ),
        elevation: 0,
      ),
      backgroundColor: AppColors.appMainColor,
      body: _mainWidget(context),
    );
  }



  Widget _mainWidget(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: AppStyles.pd20,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppStyles.sbHeight20,
                    AppImages.appLogo,
                    AppStyles.sbHeight20,
                    const SubTitleText(text: "Welcome To Green Spark",fontSize: 22,),
                    AppStyles.sbHeight51,
                    _commonSignInTypeWidget(AppImages.googleLogo,"Continue With Google",(){
                      socialLoginHelper.googleSignIn();
                    }),
                     AppStyles.sbHeight20,
                    _commonSignInTypeWidget(AppImages.fbLogo,"Continue With Facebook",(){
                      socialLoginHelper.loginWithFacebook();
                    }),
                    AppStyles.sbHeight20,
                    _commonSignInTypeWidget(AppImages.mobileIcon,"Continue With Phone",(){
                      navigatorKey.currentState!.push(ScreenNavigation.createRoute(
                          widget: const SignInScreen()));
                    }),
                    AppStyles.sbHeight20,
                    _commonSignInTypeWidget(AppImages.emailIcon,"Continue With Email",(){
                      navigatorKey.currentState!.push(ScreenNavigation.createRoute(
                          widget: const SignInScreen()));
                    }),
                    AppStyles.sbHeight55,
                    _richTextWidget(),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: PoppinsMediumText(text: 'By Continuing You Are Agreeing To Policies And Rules', fontSize: 16,textAlign: TextAlign.center,)
          ),
          AppStyles.sbHeight51,
        ],
      ),
    );
  }

  Widget _commonSignInTypeWidget(Widget icon,String label,VoidCallback onTap){
    return InkWell(
      onTap: ()=>onTap(),
      child: Container(
        padding: const EdgeInsets.only(left: 40,top: 10,bottom: 10,right: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(d_4),
          color: AppColors.whiteColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            AppStyles.sbWidth10,
            SubTitleText(text: label,fontSize: 16,color: AppColors.textColor,),
            // Text(label,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)
          ],
        ),
      ),
    );
  }


  Widget _richTextWidget(){
    return RichText(
        text:
     TextSpan(
        style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14),
        children:[
         const TextSpan(text: "Don’t Have An Account?"),
         TextSpan(
             text: " Sign up",
             recognizer: TapGestureRecognizer()
               ..onTap = () {
                 // _navigateToWebView();
                 navigatorKey.currentState!.push(ScreenNavigation.createRoute(
                     widget: const SignUpScreen()));
               },
             style: const TextStyle(fontWeight: FontWeight.w800)),
      ]
    ));
  }

}
