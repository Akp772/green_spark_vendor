import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/providers/stocks_provider.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/stocks_screen/add_stock_without_varient_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {

  StocksProvider? stocksProvider;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    stocksProvider = Provider.of<StocksProvider>(context,listen: true);
    return Scaffold(
        appBar:  AppBarWidget(title: widget.title,),
        body: _mainWidget());
  }


  Widget _mainWidget(){
    return Padding(
      padding: AppStyles.pd20,
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: SearchTextField(
                borderColor : AppColors.textColor,
                controller: controller,
                hint: "Search a product by its GTIN ,name or model no.",
                fontColor: AppColors.textColor
            ),
          ),
          AppStyles.sbHeight20,
          _productList(),
        ],
      ),
    );
  }

  Widget _productList(){
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context,index) => _productItem(),
          separatorBuilder: (context,index) => AppStyles.sbHeight10,
          itemCount: 1
      ),
    );
  }


  Widget _productItem(){
    return  Column(
      children: [
        Row(
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
                  const CommonText(text: "Product Name : i phone 15",fontSize: 14,),
                  AppStyles.sbHeight5,
                  const CommonText(text: "Model number: DT65ERTC66",fontSize: 14,color: AppColors.textColor,),
                  AppStyles.sbHeight5,
                  const CommonText(text: "Brand: apple",fontSize: 14,color: AppColors.textColor,),
                  AppStyles.sbHeight5,
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: AppStyles.pdH20,
          child: CommonAppButton(text: widget.title, onTap: (){
            Navigator.push(context, ScreenNavigation.createRoute(widget: const AddStockWithoutVariantScreen()));
          }),
        )
      ],
    );
  }



}
