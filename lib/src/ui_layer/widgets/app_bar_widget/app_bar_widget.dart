import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/device_info_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appMainColor,
      elevation: 0,
      centerTitle: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15),
        child: InkWell(
            onTap: (){
              navigatorKey.currentState!.pop();
            },
            child: AppImages.backIcon),
      ),
      title: PoppinsMediumText(text: title,fontSize: 18,color: AppColors.whiteColor,),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(DeviceInfo.width,60);
}
