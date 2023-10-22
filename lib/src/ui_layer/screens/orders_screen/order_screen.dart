import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:green_spark_vendor/src/business_layer/providers/order_provider.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/orders_screen/order_detail.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  int index = 0;
  final TextEditingController controller = TextEditingController();
  OrdersProvider? ordersProvider;

  @override
  void initState() {
    _getOrders();
    super.initState();
  }

  void _getOrders(){
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async{
      ordersProvider = Provider.of<OrdersProvider>(context,listen: false);
      // ordersProvider.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Orders"),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return  SafeArea(
        child: Column(
          children: [
            _commonSearchWidget(),
            _dataTabWidget(),
            Expanded(
                child: _dataListWidget()
            ),
          ],
        )
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
              text: "Create Order", onTap: (){
              // Navigator.of(context).push(ScreenNavigation.createRoute(widget: const AddCouponScreen()));
            },fontSize: 14,)
          ],
        ),
      ),
    );
  }
  Widget _dataTabWidget(){
    return Container(
      padding: AppStyles.pd15,
      color: AppColors.lightGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 2,
              child: _commonBoldText("Sr. No",fontSize: 14)),
          // AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonBoldText("Order ID",fontSize: 14)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 3,
              child: _commonBoldText("Order Date",fontSize: 14)),
          AppStyles.sbWidth10,
         Expanded(
              flex: 2,
              child: _commonBoldText("Status",fontSize: 14)),
          AppStyles.sbWidth10,
          Expanded(
              flex: 2,
              child: _commonBoldText("View",fontSize: 14)),
        ],
      ),
    );
  }


  Widget _dataListWidget(){
    return ListView.separated(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context,index) => Container(
            color: index%2 != 0 ? AppColors.tableBgColor : AppColors.whiteColor,
            padding: AppStyles.pdV10,
            child: _dataWidget()),
        separatorBuilder: (context,index) => AppStyles.sbHeight10,
        itemCount: 4);
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
    return Padding(
      padding: AppStyles.pdH15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
              flex: 1,
              child: SubTitleText(text:"1",fontSize: 14,color: AppColors.textGreyColor,textAlign: TextAlign.center,)),
          const Expanded(
              flex: 3,
              child: SubTitleText(text:"2352",fontSize: 14,color: AppColors.textGreyColor,textAlign: TextAlign.center)),
          const Expanded(
              flex: 3,
              child: SubTitleText(text:"i phone 15",fontSize: 14,color: AppColors.textGreyColor,textAlign: TextAlign.center)),
          Expanded(
            flex: 3,
            child: Container(
              padding: AppStyles.pd6,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.lightBlueThirdColor
              ),
              child: _commonBoldText("Pending",fontSize: 14,color: AppColors.whiteColor),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, ScreenNavigation.createRoute(widget: const OrderDetailsScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: AppImages.blueEyeIcon,
            ),
          )
        ],
      ),
    );
  }

  Widget _commonBoldText(String text,{double fontSize = 16,Color color = AppColors.textGreyColor}){
    return PoppinsSemiBoldText(text: text, fontSize: fontSize,color: color,textAlign: TextAlign.center,);
  }
}
