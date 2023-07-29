import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/table_widgets/common_table_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class StockDetailScreen extends StatefulWidget {
  const StockDetailScreen({Key? key}) : super(key: key);

  @override
  State<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppStyles.pd20,
              child: Column(
                children: [
                  _productItem(),
                  AppStyles.sbHeight20,
                  _moreInfoWidget(),
                  AppStyles.sbHeight20,
                ],
              ),
            ),
            const DividerWidget(),
            Padding(
              padding: AppStyles.pd20,
              child: _productManufacturingDetails(),
            )
          ],
        )
    );
  }


  Widget _productManufacturingDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _productManufacturingDetailsItemWidget("Neck","Round Neck"),
            _productManufacturingDetailsItemWidget("Weave Type","Machine Wash"),
          ],
        ),
        AppStyles.sbHeight15,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _productManufacturingDetailsItemWidget("Neck","Round Neck"),
            _productManufacturingDetailsItemWidget("Weave Type","Machine Wash"),
          ],
        ),
        AppStyles.sbHeight15,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _productManufacturingDetailsItemWidget("Neck","Round Neck"),
            _productManufacturingDetailsItemWidget("Weave Type","Machine Wash"),
          ],
        )
      ],
    );
  }

  Widget _productManufacturingDetailsItemWidget(String text,String labelText){
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoppinsSemiBoldText(text: text, fontSize: 14,color: AppColors.textColor,),
          SubTitleText(text: labelText, fontSize: 14,color: AppColors.textColor,)
        ],
      ),
    );
  }

  Widget _productItem(){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration:  BoxDecoration(
                color: AppColors.productItemBgColor,
                borderRadius: BorderRadius.circular(4)
            ),
            child: AppImages.productDemoImg,
          ),
        ),
        AppStyles.sbWidth10,
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PoppinsSemiBoldText(text: "Zara", fontSize: 14,color: AppColors.textGreyColor,),
              AppStyles.sbHeight5,
              const CommonText(text: "lopsum dolor sit amet ctetur. Vestibulum t",fontSize: 14,),
              AppStyles.sbHeight5,
              const CommonText(text: "Sold by : shopee",fontSize: 14,color: AppColors.textColor,),
              AppStyles.sbHeight5,
              AppStyles.sbHeight5,
              Row(
                children: [
                  const PoppinsSemiBoldText(text: "Price - USD 220", fontSize: 14,color: AppColors.textColor,),
                  AppStyles.sbWidth10,
                  const CommonText(text: "( USD 220)",fontSize: 14,color: AppColors.appMainColor,textDecoration: TextDecoration.lineThrough,),
                ],
              ),
              AppStyles.sbHeight5,
              Row(
                children: [
                  Container(
                    padding: AppStyles.pd2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: AppColors.textColor,width: 1)
                    ),
                    child: AppImages.returnIcon,
                  ),
                  AppStyles.sbWidth8,
                  _richTextWidget()
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _moreInfoWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PoppinsMediumText(text: "Shopee Green Red Dress", fontSize: 14,color: AppColors.textGreyColor,),
        AppStyles.sbHeight10,
        const CommonText(text: "Lorem ipsum dolor sit amet consectetur. Mauris sed eget metus montes morbi tempus nullam. Urna turpis natoque aliquam neque ",fontSize: 12,color: AppColors.blackTextColor,)
      ],
    );
  }

  Widget _richTextWidget(){
    return RichText(
        text: const TextSpan(
            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: AppColors.textColor),
            children:[
              TextSpan(text:'12 day '),
              TextSpan(text:'return available',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: AppColors.textColor)),
            ]
        )
    );
  }
}
