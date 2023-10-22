import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/network/api_constants.dart';
import 'package:green_spark_vendor/src/business_layer/providers/stocks_provider.dart';
import 'package:green_spark_vendor/src/data_layer/models/stocks_model/stocks_without_variant_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/table_widgets/common_table_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:provider/provider.dart';

class ShippingListScreen extends StatefulWidget {
  const ShippingListScreen({Key? key}) : super(key: key);

  @override
  State<ShippingListScreen> createState() => _ShippingListScreenState();
}

class _ShippingListScreenState extends State<ShippingListScreen> {

  final TextEditingController controller = TextEditingController();

  int tabIndex = 0;
  StocksProvider? stocksProvider;

  @override
  void initState() {
    _getStocksWithoutVariant();
    super.initState();
  }

  void _getStocksWithoutVariant(){
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      stocksProvider = Provider.of<StocksProvider>(context,listen: false);
      stocksProvider!.getStocksWithoutVariant();
    });
  }

  void _getStocksWithVariant(){
    stocksProvider!.getStocksWithVariant();
  }

  @override
  Widget build(BuildContext context) {
    stocksProvider = Provider.of<StocksProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: InkWell(
              onTap: (){
                navigatorKey.currentState!.pop();
              },
              child: AppImages.backIcon),
        ),
        centerTitle: true,
        elevation: 0,
        title: const PoppinsMediumText(text: "Shipping",fontSize: 18,color: AppColors.whiteColor,),
      ),
      body: _mainWidget(context),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            _topTabBarWidget(),
            _commonSearchWidget(),
            tabIndex == 0 ? const CarrierDataTableTopWidget() : const ShippingDataTableTopWidget(),
            Expanded(
              child: tabIndex == 0 ? _carrierWidget() : _shippingWidget() ,
            ),
          ],
        )
    );
  }

  Widget _carrierWidget(){
    final MaterialStateProperty<Color?> trackColor =
    MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        // Track color when the switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.amber;
        }
        // Otherwise return null to set default track color
        // for remaining states such as when the switch is
        // hovered, focused, or disabled.
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
    MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        // Material color when switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }
        // Material color when switch is disabled.
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        // Otherwise return null to set default material color
        // for remaining states such as when the switch is
        // hovered, or focused.
        return null;
      },
    );
    return true  ? ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context,index)=>  CarrierDataTableItemWidget(
          srNo: index+1,
          widget: Switch(
            // This bool value toggles the switch.
            value: true,
            overlayColor: overlayColor,
            trackColor: trackColor,
            thumbColor: const MaterialStatePropertyAll<Color>(Colors.black),
            onChanged: (bool value) {
              // This is called when the user toggles the switch.
              // setState(() {
              //   // light = value;
              // });
            },
          ),
          nameText: "",
          onDelete: (){},
          onEdit: (){},
          onView: (){},
        ),
        separatorBuilder:  (context,index)=> const DividerWidget(),
        itemCount: 2
    ):const SizedBox.shrink();
  }

  Widget _shippingWidget(){
    return stocksProvider!.stocksWithVariantResponseModel != null && stocksProvider!.stocksWithVariantResponseModel!.context != null && stocksProvider!.stocksWithVariantResponseModel!.context!.data != null  ? ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context,index)=>  DataTableItemWidget(
          srNo: index+1,
          widget: CupertinoSwitch(
            value: true,
            onChanged: (bool value) {  },
          ),
          nameText: stocksProvider!.stocksWithVariantResponseModel!.context!.data![index].inventoryWithVariant!.title??"",
          onDelete: (){},
          onEdit: (){},
        ),
        separatorBuilder:  (context,index)=> const DividerWidget(),
        itemCount: stocksProvider!.stocksWithVariantResponseModel!.context!.data!.length
    ):const SizedBox.shrink();
  }


  Widget _imageWidget(String image){
    return Container(
      height: 60,width: 53,
      padding: AppStyles.pd2,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: Image.network(
        "${ApiConstant.baseUrl}${image}",
        errorBuilder: (context,_,__) => const SizedBox.shrink(),
      ),
    );
  }
  Widget _topTabBarWidget(){
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _commonTabBarItemWidget("Carriers",0),
          _commonTabBarItemWidget("Shipping Zones",1),
        ],
      ),
    );
  }

  Widget _commonTabBarItemWidget(String text, int type){
    return Expanded(
      child: InkWell(
        onTap: (){
          tabIndex = type;
          if(tabIndex == 0){
            _getStocksWithoutVariant();
          }else{
            _getStocksWithVariant();
          }
          setState(() {});
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: tabIndex==type ? AppColors.onBoardingBgColor : AppColors.whiteColor,
              border: Border.all(color: AppColors.onBoardingBgColor,width: 1)
          ),
          padding: AppStyles.pdH16V8,
          child: PoppinsMediumText(text: text, fontSize: 14,color: tabIndex==type? AppColors.whiteColor:AppColors.textGreyColor,),
        ),
      ),
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
                    borderColor : AppColors.textColor,
                    controller: controller,
                    hint: "Search",
                    fontColor: AppColors.textColor
                ),
              ),
            ),
            AppStyles.sbWidth10,
            CommonAppButtonWithDynamicWidth(
              padding:  const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
              text: "Add New", onTap: (){},fontSize: 14,)
          ],
        ),
      ),
    );
  }


}
