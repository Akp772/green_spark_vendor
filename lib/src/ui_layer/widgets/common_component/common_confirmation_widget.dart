import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class CommonConfirmationWidget extends StatelessWidget {
  const CommonConfirmationWidget({Key? key, required this.onYes, required this.onNo, required this.yesText, required this.noText, required this.title}) : super(key: key);
  final VoidCallback onYes;
  final VoidCallback onNo;
  final String yesText;
  final String noText;
  final String title;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.pd20,
      child: Column(
        children: [
          SubTitleText(text: title,fontSize: 16,color: AppColors.textColor,textAlign: TextAlign.center,),
          AppStyles.sbHeight10,
          Row(
            children: [
              _commonButton(
                  InkWell(
                      onTap: onYes,
                      child:  FittedBox(child: PoppinsSemiBoldText(text: yesText, fontSize: 14,color: AppColors.textColor,))
                  ),AppColors.whiteColor
              ),
              AppStyles.sbWidth10,
              _commonButton(
                  InkWell(
                      onTap: onNo,
                      child:  FittedBox(child: PoppinsSemiBoldText(text: noText, fontSize: 14,color: AppColors.whiteColor,))
                  ),AppColors.appMainColor
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _commonButton(Widget widget,Color color){
    return Expanded(
      child: Container(
        height: 40,
        padding: AppStyles.pdV9,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: AppColors.textColor,width: 1)
        ),
        child: Align(
            alignment:Alignment.center,child: widget),
      ),
    );
  }
}
