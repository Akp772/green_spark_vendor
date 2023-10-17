import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/device_info_helper.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/local_db/user_state_hive_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/sign_up_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/sign_up_type_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/bottom_nav_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _mainWidget();
  }

  Widget _mainWidget(){
    return Scaffold(
      body: SafeArea(
        child:  Column(
          children: [
             SizedBox(
               height: 200,
               child: DrawerHeader(
                 child: FutureBuilder(
                     future: UserStateHiveHelper.instance.isLoggedIn(),
                     builder: (context,hasSnap){
                     return hasSnap.data != null && !hasSnap.data! ?_profileWidget() : _signWidget();
                 }),
               ),
             ),
            _divider(),
            // _listTileItem(AppImages.callRingIcon, "Contact Us",(){
            //
            // }),
            // _divider(),
            // _listTileItem(AppImages.termsAndConditions, "Terms & Conditions",(){
            // }),
            // _divider(),
            // _listTileItem(AppImages.privacyIcon, "Privacy Policy",(){
            // }),
            // _divider(),
            // _listTileItem(AppImages.aboutUs, "About Us",(){
            // }),
            // _divider(),
            // _listTileItem(AppImages.posterIcon, "Advertising",(){
            // }),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }

  Widget _profileWidget(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 57,width: 57,
            child: CircleAvatar(child: AppImages.profileDemoImh,)
        ),
        AppStyles.sbHeight20,
        const PoppinsSemiBoldText(text: "James Charles", fontSize: 16,color: AppColors.blackTextColor,),
        AppStyles.sbHeight20,
        InkWell(
          onTap: (){
          },
          child: Container(
            padding: AppStyles.pdH8V10,
            decoration: BoxDecoration(
              color: AppColors.appMainColor,
              borderRadius: BorderRadius.circular(d_4),
            ),
            child: const PoppinsBoldText(text: "View Profile",fontSize: 14,color: AppColors.whiteColor,textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }

  Widget _signWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){
            navigatorKey.currentState!.push(ScreenNavigation.createRoute(widget:  SignInTypesScreen()));
          },
          child: Container(
            padding: AppStyles.pdH8V10,
            decoration: BoxDecoration(
              color: AppColors.appMainColor,
              borderRadius: BorderRadius.circular(d_4),
            ),
            child: const PoppinsBoldText(text: "Sign In",fontSize: 14,color: AppColors.whiteColor,textAlign: TextAlign.center,),
          ),
        ),
        AppStyles.sbHeight10,
        _richText()
      ],
    );
  }

  Widget _richText(){
    return RichText(
        text:  TextSpan(
          style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textColor),
          children:[
            const TextSpan(text: "Don't have an account? "),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // _navigateToWebView();
                    navigatorKey.currentState!.push(ScreenNavigation.createRoute(
                        widget: const SignUpScreen()));
                  },
                text: "Sign Up",
                style: const TextStyle(color: AppColors.appMainColor,fontSize: 16,fontWeight: FontWeight.w600)),
          ]
        )
    );
  }

  Widget _divider(){
    return Container(
      height: 0.5,
      color: AppColors.textColor,
    );
  }

  Widget _listTileItem(Widget icon,String title,VoidCallback onTap){
    return ListTile(
      leading:icon,
      title:  PoppinsMediumText(text: title,fontSize: 16,color: AppColors.textColor,),
      trailing: IconButton(onPressed: onTap,icon: const Icon(Icons.arrow_forward_ios_outlined),),
    );
  }
}
