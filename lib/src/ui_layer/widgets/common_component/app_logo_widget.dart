import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({Key? key,  this.isWhite = true}) : super(key: key);
  final bool isWhite;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isWhite? AppColors.whiteColor : AppColors.appMainColor,
      padding:  EdgeInsets.symmetric(horizontal: isWhite ? 30 : 20,vertical: isWhite ? 22 : 11),
      child:  PoppinsMediumText(text: "Company Logo",fontSize: 28,color: isWhite?AppColors.blackTextColor:AppColors.whiteColor,),
    );
  }
}
