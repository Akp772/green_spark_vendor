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

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({Key? key}) : super(key: key);

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Customers",),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return Column(
      children: [
        _commonSearchWidget(),
        const CustomerDataTableTopWidget(),
        AppStyles.sbHeight20,
        _listWidget(),
      ],
    );
  }



  Widget _commonSearchWidget(){
    return SizedBox(
      height: 80,
      child: Padding(
        padding: AppStyles.pdH15,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: SearchTextField(
                    controller: controller,
                    hint: "Search",
                    fontColor: AppColors.textColor
                ),
              ),
            ),
            AppStyles.sbWidth10,
            CommonAppButtonWithDynamicWidth(
              padding:  const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
              text:  "Add Customer", onTap: (){
                Navigator.push(context, ScreenNavigation.createRoute(widget: const AddCustomerScreen()));
            },fontSize: 14,)
          ],
        ),
      ),
    );
  }

  Widget _listWidget(){
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context,index) => _dataWidget(),
          separatorBuilder: (context,index) => AppStyles.sbHeight10,
          itemCount: 4
      ),
    );
  }

  Widget _dataWidget(){
    return  Padding(
      padding: AppStyles.pdH20V12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: _commonText("1")),
          // AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: Container(
                height: 60,width: 53,
                padding: AppStyles.pd2,
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.textColor,width: 0.5)
                ),
                child: AppImages.productDemoImg,
              )),
          AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonText("Jay Singh")),
          AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonText("user1")),
          AppStyles.sbWidth10,
          InkWell(
            onTap: (){
            },
            child: Expanded(
                flex: 1,
                child: SizedBox(
                    height: 15,
                    child: AppImages.blueEyeIcon)),
          ),
        ],
      ),
    );
  }

  Widget _commonText(String text,{double fontSize = 14,Color color = AppColors.textGreyColor}){
    return SubTitleText(text: text, fontSize: fontSize,color: color,);
  }

}
