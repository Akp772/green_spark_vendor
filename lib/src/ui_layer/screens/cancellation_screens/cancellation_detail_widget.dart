import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class CancellationDetailWidget extends StatelessWidget {
  const CancellationDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Cancellation",),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return Padding(
      padding: AppStyles.pd20,
      child: Column(
        children: [
          _itemDetailWidget('Order no. -','#83731'),
           AppStyles.sbHeight5,
          _itemDetailWidget('Customer name - ','Jay Singh'),
          AppStyles.sbHeight5,
          _itemDetailWidget('Grand total -','USD 100'),
          AppStyles.sbHeight5,
          _itemDetailWidget('Payment -','Paid'),
          AppStyles.sbHeight5,
          _itemDetailWidget('Requested items - ','Item name '),
          AppStyles.sbHeight5,
          _itemDetailWidget('Requested at  - ','3 : 00 PM'),
          AppStyles.sbHeight5,
          _itemDetailWidget('Status - ','Pending '),
        ],
      ),
    );
  }


  Widget _itemDetailWidget(String label,String value){
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: PoppinsSemiBoldText(text: label, fontSize: 16,color: AppColors.blackTextColor,)),
        Expanded(
            flex: 1,
            child: SubTitleText(text: value, fontSize: 16,color: AppColors.blackTextColor,)),
      ],
    );
  }
}
