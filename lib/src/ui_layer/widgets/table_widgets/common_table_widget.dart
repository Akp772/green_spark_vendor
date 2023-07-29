import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/device_info_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class DataTableTopWidget extends StatelessWidget {
  const DataTableTopWidget({Key? key, this.firstHeading = "Image"}) : super(key: key);
  final String firstHeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.pdH20V16,
      color: AppColors.lightGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 2,
              child: _commonBoldText("Sr. No")),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText(firstHeading)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonBoldText("Name")),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText("Action")),
        ],
      ),
    );
  }

  Widget _commonBoldText(String text,{double fontSize = 16,Color color = AppColors.textGreyColor}){
    return PoppinsSemiBoldText(text: text, fontSize: fontSize,color: color,);
  }

}

class DataTableItemWidget extends StatelessWidget {
  const DataTableItemWidget({Key? key, this.srNo = 1, this.widget, this.nameText = "Women Wear"}) : super(key: key);
  final int srNo;
  final Widget? widget;
  final String nameText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.pdH20V12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppStyles.sbWidth10,
           Expanded(
              flex: 1,
              child: SubTitleText(text: srNo.toString(),fontSize: 14,color: AppColors.textColor,)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 1,
              child: widget??Container(
                height: 60,width: 53,
                padding: AppStyles.pd2,
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textColor,width: 0.5)
                ),
                child: AppImages.productDemoImg,
              )
          ),
          AppStyles.sbWidth20,
           Expanded(
              flex: 2,
              child: SubTitleText(text: nameText,fontSize: 14,color: AppColors.textColor,)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  SizedBox(
                      height: 15,
                      child: AppImages.blueEyeIcon),
                  SizedBox(
                      height: 20,
                      child: AppImages.redDeleteIcon),
                ],
              )),
        ],
      ),
    );
  }

}

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key, this.color = AppColors.textColor, this.height = 0.5}) : super(key: key);
  final Color color;
  final double height;
  @override
  Widget build(BuildContext context) {
    return _dividerWidget();
  }

  Widget _dividerWidget(){
    return Container(
      height: height,
      width: DeviceInfo.width,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}

