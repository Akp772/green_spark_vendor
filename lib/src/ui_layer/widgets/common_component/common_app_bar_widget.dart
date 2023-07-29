import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/other_screens/notification_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class CommonAppBarWidget extends StatelessWidget {
  const CommonAppBarWidget({Key? key, this.isNotification = false,this.title = "Order", this.isBackRequired = true}) : super(key: key);
  final bool isNotification;
  final String title;
  final bool isBackRequired;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.pd20,
      color: AppColors.appMainColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(isBackRequired)InkWell(
               onTap: (){
                 navigatorKey.currentState!.pop();
               },
              child: AppImages.backIcon),
          if(isBackRequired)AppStyles.sbWidth10,
          Expanded(
            child: PoppinsMediumText(text: title,fontSize: 18,color: AppColors.whiteColor,),
          ),
         if(!isNotification) InkWell(
             onTap:(){
                navigatorKey.currentState!.push(ScreenNavigation.createRoute(widget: const NotificationScreen()));
               },
             child: const Icon(Icons.notifications_none,color: AppColors.whiteColor,))
        ],
      ),
    );
  }


}
