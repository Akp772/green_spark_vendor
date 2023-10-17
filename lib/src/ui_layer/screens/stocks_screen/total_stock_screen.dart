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

class TotalStockScreen extends StatefulWidget {
  const TotalStockScreen({Key? key}) : super(key: key);

  @override
  State<TotalStockScreen> createState() => _TotalStockScreenState();
}

class _TotalStockScreenState extends State<TotalStockScreen> {

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
        title: const PoppinsMediumText(text: "Total Stock/inventory",fontSize: 18,color: AppColors.whiteColor,),
      ),
      body: _mainWidget(context),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            // const CommonAppBarWidget(title: "Total Stock/inventory",isNotification: true),
            _topTabBarWidget(),
            _commonSearchWidget(),
            const DataTableTopWidget(),
            Expanded(
              child: tabIndex == 0 ? _withoutVariantWidget() : _withVariantWidget() ,
            ),
          ],
        )
    );
  }

  Widget _withoutVariantWidget(){
    return stocksProvider!.stocksWithoutVariantResponseModel != null && stocksProvider!.stocksWithoutVariantResponseModel!.context != null && stocksProvider!.stocksWithoutVariantResponseModel!.context!.data != null  ? ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context,index)=>  DataTableItemWidget(
          srNo: index+1,
          widget: _imageWidget(stocksProvider!.stocksWithoutVariantResponseModel!.context!.data![index].image??""),
          nameText: stocksProvider!.stocksWithoutVariantResponseModel!.context!.data![index].product!.name??"",
        ),
        separatorBuilder:  (context,index)=> const DividerWidget(),
        itemCount: stocksProvider!.stocksWithoutVariantResponseModel!.context!.data!.length
    ):const SizedBox.shrink();
  }

  Widget _withVariantWidget(){
    return stocksProvider!.stocksWithVariantResponseModel != null && stocksProvider!.stocksWithVariantResponseModel!.context != null && stocksProvider!.stocksWithVariantResponseModel!.context!.data != null  ? ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context,index)=>  DataTableItemWidget(
          srNo: index+1,
          widget: _imageWidget(stocksProvider!.stocksWithVariantResponseModel!.context!.data![index].imageVariant??""),
          nameText: stocksProvider!.stocksWithVariantResponseModel!.context!.data![index].inventoryWithVariant!.title??"",
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
          _commonTabBarItemWidget("Inventory without variant",0),
          _commonTabBarItemWidget("Inventory with Variant",1),
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
              text: "Add Inventory", onTap: (){},fontSize: 14,)
          ],
        ),
      ),
    );
  }


}
