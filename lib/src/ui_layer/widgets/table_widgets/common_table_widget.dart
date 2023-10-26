import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/device_info_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class DataTableTopWidget extends StatelessWidget {
  const DataTableTopWidget({Key? key,
    this.firstHeading = "Image", this.secondHeading = "Name"}) : super(key: key);
  final String firstHeading;
  final String secondHeading;

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
          // AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText(firstHeading)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonBoldText(secondHeading)),
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

class CancellationDataTableTopWidget extends StatelessWidget {
  const CancellationDataTableTopWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.pdH15V11,
      color: AppColors.lightGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: _commonBoldText("#",fontSize: 14)),
          // AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText("Order",fontSize: 14)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonBoldText("Customer",fontSize: 14)),
          AppStyles.sbWidth10,
         Expanded(
              flex: 3,
              child: _commonBoldText("Grand total",fontSize: 14)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText("Action",fontSize: 14)),
        ],
      ),
    );
  }

  Widget _commonBoldText(String text,{double fontSize = 16,Color color = AppColors.textGreyColor}){
    return PoppinsSemiBoldText(text: text, fontSize: fontSize,color: color,);
  }

}

class CustomerDataTableTopWidget extends StatelessWidget {
  const CustomerDataTableTopWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.pdH15V11,
      color: AppColors.lightGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: _commonBoldText("#",fontSize: 14)),
          // AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText("Image",fontSize: 14)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonBoldText("User name",fontSize: 14)),
          AppStyles.sbWidth10,
         Expanded(
              flex: 3,
              child: _commonBoldText("Nickname",fontSize: 14)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText("Action",fontSize: 14)),
        ],
      ),
    );
  }

  Widget _commonBoldText(String text,{double fontSize = 16,Color color = AppColors.textGreyColor}){
    return PoppinsSemiBoldText(text: text, fontSize: fontSize,color: color,textAlign: TextAlign.center,);
  }

}

class ReviewsDataTableTopWidget extends StatelessWidget {
  const ReviewsDataTableTopWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.pdH16V20,
      color: AppColors.lightGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: _commonBoldText("#",fontSize: 14)),
          // AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonBoldText("Product",fontSize: 14)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText("Image",fontSize: 14)),
          AppStyles.sbWidth10,
         Expanded(
              flex: 3,
              child: _commonBoldText("Rating",fontSize: 14)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText("Action",fontSize: 14)),
        ],
      ),
    );
  }

  Widget _commonBoldText(String text,{double fontSize = 16,Color color = AppColors.textGreyColor}){
    return PoppinsSemiBoldText(text: text, fontSize: fontSize,color: color,textAlign: TextAlign.center,);
  }

}

class ProductReviewsDataTableTopWidget extends StatelessWidget {
  const ProductReviewsDataTableTopWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.pdH16V20,
      color: AppColors.lightGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 3,
              child: _commonBoldText("Customer",fontSize: 14)),
          // AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonBoldText("Rating",fontSize: 14)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonBoldText("Comment",fontSize: 14)),
          AppStyles.sbWidth10,
        ],
      ),
    );
  }

  Widget _commonBoldText(String text,{double fontSize = 16,Color color = AppColors.textGreyColor,TextAlign textAlign = TextAlign.left}){
    return PoppinsSemiBoldText(text: text, fontSize: fontSize,color: color,textAlign: textAlign,);
  }

}

class CouponDataTableTopWidget extends StatelessWidget {
  const CouponDataTableTopWidget({Key? key,
    this.firstHeading = "Image", this.secondHeading = "Name"}) : super(key: key);
  final String firstHeading;
  final String secondHeading;

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
          // AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonBoldText(firstHeading)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText(secondHeading)),
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
  const DataTableItemWidget({Key? key, this.srNo = 1, this.widget, this.nameText = "Women Wear",  this.onEdit,  this.onDelete}) : super(key: key);
  final int srNo;
  final Widget? widget;
  final String nameText;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

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

class CouponDataTableItemWidget extends StatelessWidget {
  const CouponDataTableItemWidget({Key? key, this.srNo = 1, this.widget, this.nameText = "Women Wear",  this.onEdit,  this.onDelete, this.onView}) : super(key: key);
  final int srNo;
  final Widget? widget;
  final String nameText;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onView;

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
              flex: 3,
              child: widget??const SizedBox.shrink()
          ),
          AppStyles.sbWidth20,
           Expanded(
              flex: 2,
              child: SubTitleText(text: nameText,fontSize: 14,color: AppColors.textColor,)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  InkWell(
                    onTap: onView,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                          height: 15,
                          child: AppImages.blueEyeIcon),
                    ),
                  ),
                  InkWell(
                    onTap: onEdit,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                          height: 15,
                          child: AppImages.editIcon),
                    ),
                  ),
                  InkWell(
                    onTap: onDelete,
                    child: SizedBox(
                        height: 20,
                        child: AppImages.redDeleteIcon),
                  ),
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

class ShippingDataTableTopWidget extends StatelessWidget {
  const ShippingDataTableTopWidget({Key? key,
    this.firstHeading = "Image", this.secondHeading = "Name"}) : super(key: key);
  final String firstHeading;
  final String secondHeading;

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
              child: _commonBoldText("Country")),
          // AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonBoldText("Shipping Rates")),
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

class CarrierDataTableTopWidget extends StatelessWidget {
  const CarrierDataTableTopWidget({Key? key,
    this.firstHeading = "Image", this.secondHeading = "Name"}) : super(key: key);
  final String firstHeading;
  final String secondHeading;

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
          // AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonBoldText("Name")),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText("Status")),
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

class CarrierDataTableItemWidget extends StatelessWidget {
  const CarrierDataTableItemWidget({Key? key, this.srNo = 1, this.widget, this.nameText = "Women Wear",  this.onEdit,  this.onDelete, this.onView}) : super(key: key);
  final int srNo;
  final Widget? widget;
  final String nameText;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onView;

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
              flex: 3,
              child: SubTitleText(text: nameText,fontSize: 14,color: AppColors.textColor,)),
          AppStyles.sbWidth20,
          Expanded(
              flex: 2,
              child: widget??const SizedBox.shrink()
          ),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  InkWell(
                    onTap: onView,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                          height: 15,
                          child: AppImages.blueEyeIcon),
                    ),
                  ),
                  InkWell(
                    onTap: onEdit,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                          height: 15,
                          child: AppImages.editIcon),
                    ),
                  ),
                  InkWell(
                    onTap: onDelete,
                    child: SizedBox(
                        height: 20,
                        child: AppImages.redDeleteIcon),
                  ),
                ],
              )),
        ],
      ),
    );
  }

}