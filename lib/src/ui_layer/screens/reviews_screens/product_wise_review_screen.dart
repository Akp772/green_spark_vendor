import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/customer_screens/add_customer_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/table_widgets/common_table_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

import '../../../business_layer/util/helper/screen_navigation_helper.dart';

class ProductReviewsListScreen extends StatefulWidget {
  const ProductReviewsListScreen({Key? key}) : super(key: key);

  @override
  State<ProductReviewsListScreen> createState() => _ProductReviewsListScreenState();
}

class _ProductReviewsListScreenState extends State<ProductReviewsListScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Reviews",),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:AppStyles.pd20,
          child: PoppinsMediumText(text: "Product Reviews", fontSize: 16,color: AppColors.blackTextColor,),
        ),
        const ProductReviewsDataTableTopWidget(),
        _listWidget(),
      ],
    );
  }


  Widget _listWidget(){
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context,index) => _dataWidget(index),
          separatorBuilder: (context,index) => const SizedBox.shrink(),
          itemCount: 4
      ),
    );
  }

  Widget _dataWidget(int index){
    return  Container(
      color: index%2 !=0 ? AppColors.tableBgColor : AppColors.whiteColor,
      padding: AppStyles.pdH20V12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 3,
              child: _commonText("Jay Singh")),
          Expanded(
              flex: 3,
              child: _commonText("Steam Iron")),
          AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonText("This is very good product")),
        ],
      ),
    );
  }

  Widget _commonText(String text,{double fontSize = 14,Color color = AppColors.textGreyColor}){
    return SubTitleText(text: text, fontSize: fontSize,color: color,);
  }

}
