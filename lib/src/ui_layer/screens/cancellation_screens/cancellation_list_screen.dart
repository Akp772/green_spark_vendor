import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/cancellation_screens/cancellation_detail_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/table_widgets/common_table_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class CancellationScreen extends StatefulWidget {
  const CancellationScreen({Key? key}) : super(key: key);

  @override
  State<CancellationScreen> createState() => _CancellationScreenState();
}

class _CancellationScreenState extends State<CancellationScreen> {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Cancellation",),
      body: _mainWidget(),
    );
  }

 Widget _mainWidget() {
    return Column(
      children: [
        Padding(
          padding: AppStyles.pd20,
          child: SizedBox(
            height: 40,
            child: SearchTextField(
                controller: controller,
                hint: "Search",
                fontColor: AppColors.textColor
            ),
          ),
        ),
        const CancellationDataTableTopWidget(),
        AppStyles.sbHeight20,
        _listWidget(),
      ],
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
              child: _commonText("#83731")),
          AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonText("Jay Singh")),
          AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonText("USD 100")),
          AppStyles.sbWidth10,
          InkWell(
            onTap: (){
              Navigator.push(context, ScreenNavigation.createRoute(widget: const CancellationDetailWidget()));
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
