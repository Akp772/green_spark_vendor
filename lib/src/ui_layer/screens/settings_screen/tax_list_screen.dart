import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/customer_screens/add_customer_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/table_widgets/common_table_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class TaxSettingListScreen extends StatefulWidget {
  const TaxSettingListScreen({Key? key}) : super(key: key);

  @override
  State<TaxSettingListScreen> createState() => _TaxSettingListScreenState();
}

class _TaxSettingListScreenState extends State<TaxSettingListScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Tax Setting",),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return Column(
      children: [
        _commonSearchWidget(),
        _dataTableWidget(),
        _listWidget(),
      ],
    );
  }

  Widget _dataTableWidget(){
    return Container(
      padding: AppStyles.pdH15V11,
      color: AppColors.lightGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _commonBoldText("#",fontSize: 14),
          AppStyles.sbWidth20,
          Expanded(
              flex: 1,
              child: _commonBoldText("Tax",fontSize: 14)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 1,
              child: _commonBoldText("Tax rate",fontSize: 14)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText("Region",fontSize: 14)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText("Status",fontSize: 14)),
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
              text:  "Add Tax", onTap: (){
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
          _commonText("1"),
          AppStyles.sbWidth20,
          Expanded(
              flex: 1,
              child: _commonText("sGST")),
          Expanded(
              flex: 1,
              child: _commonText("18%")),
          Expanded(
              flex: 2,
              child: _commonText("Wallonia ::Belgium")),
          Expanded(
              flex: 2,
              child: _commonText("Get comprehensive coverage")),
          InkWell(
            onTap: (){
            },
            child: Expanded(
                flex: 2,
                child: SizedBox(
                    height: 15,
                    child: AppImages.blueEyeIcon)),
          ),
        ],
      ),
    );
  }

  Widget _commonText(String text,{double fontSize = 14,Color color = AppColors.textGreyColor}){
    return SubTitleText(text: text, fontSize: fontSize,color: color,textAlign: TextAlign.center);
  }

}
