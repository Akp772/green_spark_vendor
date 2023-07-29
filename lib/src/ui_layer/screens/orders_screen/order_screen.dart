import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return  SafeArea(
        child: Column(
          children: [
            const CommonAppBarWidget(),
            _topTabBarWidget(),
            Expanded(child: _dataListWidget()),
          ],
        )
    );
  }

  Widget _dataListWidget(){
    return Container(
      padding: AppStyles.pd20,
      child: Column(
        children: [
          _tableTopWidget(),
           AppStyles.sbHeight10,
           Expanded(
             child: ListView.separated(
                 shrinkWrap: true,
                 itemBuilder: (context,index) => _dataWidget(),
                 separatorBuilder: (context,index) => AppStyles.sbHeight10,
                 itemCount: 4),
           )
        ],
      ),
    );
  }

  Widget _topTabBarWidget(){
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _commonTabBarItemWidget("Unfulfillilled (0)",0),
          _commonTabBarItemWidget("Fulfilled (0)",1),
          _commonTabBarItemWidget("Archived (0)",2),
        ],
      ),
    );
  }

  Widget _commonTabBarItemWidget(String text, int type){
    return Expanded(
      child: InkWell(
        onTap: (){
          index = type;
          setState(() {});
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: index==type ? AppColors.appMainColor : AppColors.whiteColor,
            border: Border.all(color: AppColors.appMainColor,width: 1)
          ),
          padding: AppStyles.pdH16V8,
          child: PoppinsMediumText(text: text, fontSize: 14,color: index==type? AppColors.whiteColor:AppColors.textGreyColor,),
        ),
      ),
    );
  }

  Widget _tableTopWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _commonBoldText("Order no."),
        AppStyles.sbWidth10,
        Expanded(child: _commonBoldText("Payment")),
        AppStyles.sbWidth10,
        _commonBoldText("Action"),
      ],
    );
  }

  Widget _dataWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SubTitleText(text:"#383938",fontSize: 16,color: AppColors.lightBlueSecondColor,),
        AppStyles.sbWidth10,
        Container(
          padding: AppStyles.pdH15V10,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.lightBlueThirdColor
          ),
          child: _commonBoldText("Pending",fontSize: 14,color: AppColors.whiteColor),
        ),
        AppStyles.sbWidth10,
        Row(
          children: [
            AppImages.blueEyeIcon,
            AppStyles.sbWidth5,
            AppImages.deleteIcon,
          ],
        )
      ],
    );
  }

  Widget _commonBoldText(String text,{double fontSize = 16,Color color = AppColors.textGreyColor}){
    return PoppinsSemiBoldText(text: text, fontSize: fontSize,color: color,textAlign: TextAlign.center,);
  }
}
