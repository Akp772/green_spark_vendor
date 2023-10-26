import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/settings_screen/return_and_canacellation_screen/return_and_cancellation_list_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/settings_screen/specifications_screens/specifications_list_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/settings_screen/tax_list_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Settings',),
      body: _mainWidget(context),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return Padding(
      padding: AppStyles.pd20,
      child: Column(
        children: [
          _commonWidget(AppImages.taxIcon, "Tax Settings",const TaxSettingListScreen(),context),
          AppStyles.sbHeight20,
          _commonWidget(AppImages.shopIcon, "Shop Settings",SizedBox(),context),
          AppStyles.sbHeight20,
          _commonWidget(AppImages.notepadIcon, "Specifications",const SpecificationListScreen(),context),
          AppStyles.sbHeight20,
          _commonWidget(AppImages.returnIcon, "Return And Cancellation Policy",ReturnPolicyListScreen(),context),
        ],
      ),
    );
  }

  Widget _commonWidget(Widget icon,String text,Widget widget,BuildContext context){
    return InkWell(
      onTap: (){
        Navigator.push(context, ScreenNavigation.createRoute(widget: widget));
      },
      child: Row(
        children: [
          icon,
          AppStyles.sbWidth10,
          PoppinsMediumText(text: text, fontSize: 18,color: AppColors.textGreyColor,)
        ],
      ),
    );
  }

}
