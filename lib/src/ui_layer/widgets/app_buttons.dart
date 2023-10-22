import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class CommonAppButton extends StatelessWidget {
  const CommonAppButton({Key? key, required this.text, required this.onTap}) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: AppStyles.pdV15,
        decoration: BoxDecoration(
          color: AppColors.appMainColor,
          borderRadius: BorderRadius.circular(d_4),
        ),
        child: PoppinsBoldText(text: text,fontSize: 18,color: AppColors.whiteColor,textAlign: TextAlign.center,),
      ),
    );
  }
}

class CommonAppButtonWithDynamicWidth extends StatelessWidget {
  const CommonAppButtonWithDynamicWidth({Key? key, required this.text, required this.onTap, this.fontSize = 18, this.padding = AppStyles.pdH8V10, this.buttonColor = AppColors.appMainColor}) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final double fontSize;
  final EdgeInsets padding;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(d_4),
        ),
        child: PoppinsBoldText(text: text,fontSize: fontSize,color: AppColors.whiteColor,textAlign: TextAlign.center,),
      ),
    );
  }
}

class CommonWhiteAppButton extends StatelessWidget {
  const CommonWhiteAppButton({Key? key, required this.text, required this.onTap}) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: AppStyles.pdV15,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.textColor,width: 1),
          borderRadius: BorderRadius.circular(d_4),
        ),
        child: PoppinsSemiBoldText(text: text,fontSize: 16,color: AppColors.textGreyColor,textAlign: TextAlign.center,),
      ),
    );
  }
}

class WhiteAppButton extends StatelessWidget {
  const WhiteAppButton({Key? key, required this.text, required this.onTap}) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: AppStyles.pdH8V10,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.textColor,width: 1),
          borderRadius: BorderRadius.circular(d_4),
        ),
        child: PoppinsSemiBoldText(text: text,fontSize: 16,color: AppColors.textGreyColor,textAlign: TextAlign.center,),
      ),
    );
  }
}
