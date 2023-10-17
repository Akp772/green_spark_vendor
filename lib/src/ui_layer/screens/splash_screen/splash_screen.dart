import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/local_db/user_state_hive_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/sign_in_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/cart_screen/added_to_cart_list_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/catalogue_screens/catalogue_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/home_screens/home_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/orders_screen/order_detail_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/orders_screen/order_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/other_screens/shop_details_form_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/stocks_screen/stock_details_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/stocks_screen/stock_out_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/stocks_screen/total_stock_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/app_logo_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  bool isLogged = false;

  @override
  void initState() {
    // startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return const Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: /*Center(child: AppImages.appLogo)*/
      Center(
        child: AppLogoWidget(),
      ),
    );
  }

  /* Timer to show splash */
  void startTimer() {
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 1000)).then((value) async {
        if(await UserStateHiveHelper.instance.isLoggedIn()) {
          navigatorKey.currentState!.push(
              ScreenNavigation.createRoute(widget:  const HomeScreen()),);
          }else{
            navigatorKey.currentState!.push(
            ScreenNavigation.createRoute(widget:  const SignInScreen()),);
           }
        });
      // });

  }
}
