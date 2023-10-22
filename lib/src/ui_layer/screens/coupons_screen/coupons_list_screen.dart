import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/network/api_constants.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/providers/catalogue_provider.dart';
import 'package:green_spark_vendor/src/business_layer/providers/coupons_provider.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/progress_helper.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/add_attribute_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/all_attribute_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/coupon_models/coupons_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/all_product_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/catalogue_screens/add_attribute.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/catalogue_screens/add_product.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/coupons_screen/add_coupon_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_dialog_widgets/app_dialogs.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_confirmation_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/table_widgets/common_table_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/flutter_toast_helper.dart';
import 'package:provider/provider.dart';

class CouponsListScreen extends StatefulWidget {
  const CouponsListScreen({Key? key}) : super(key: key);

  @override
  State<CouponsListScreen> createState() => _CouponsListScreenState();
}

class _CouponsListScreenState extends State<CouponsListScreen> {

  final TextEditingController controller = TextEditingController();

  int tabIndex = 0;
  CatalogueProvider? catalogueProvider;
  CouponsProvider? couponsProvider;

  @override
  void initState() {
    _getAllCoupons();
    super.initState();
  }

  void _getAllCoupons(){
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      couponsProvider = Provider.of<CouponsProvider>(context,listen: false);
      couponsProvider!.getAllCoupons();
    });
  }

  @override
  Widget build(BuildContext context) {
    couponsProvider = Provider.of<CouponsProvider>(context,listen: true);
    return Scaffold(
      appBar: const AppBarWidget(title: "Coupon",),
      body: _mainWidget(context),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            _commonSearchWidget(),
            const CouponDataTableTopWidget(firstHeading: "Coupon Code",secondHeading:"Status"),
            Expanded(
              child:  _attributeListWidget(),
            ),
          ],
        )
    );
  }

  Widget _attributeListWidget(){
    return couponsProvider!.allCouponResponseModel != null && couponsProvider!.allCouponResponseModel!.context != null && couponsProvider!.allCouponResponseModel!.context!.data != null ?ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context,index)=> _attributeDataWidget(index,couponsProvider!.allCouponResponseModel!.context!.data![index]),
        separatorBuilder:  (context,index)=> const DividerWidget(),
        itemCount: couponsProvider!.allCouponResponseModel!.context!.data!.length):const SizedBox();
  }

  Widget _attributeDataWidget(int index, CouponsData data,){
    return CouponDataTableItemWidget(
      srNo: index+1,
      widget:  SubTitleText(text: data.code??"",fontSize: 16,color: AppColors.blackTextColor,textAlign: TextAlign.center,),
      nameText: data.status??"",
      onView: (){
        Navigator.of(context).push(ScreenNavigation.createRoute(widget:  AddCouponScreen(couponData:data,isView: true,)));
      },
      onEdit: (){
        Navigator.of(context).push(ScreenNavigation.createRoute(widget:  AddCouponScreen(couponData:data)));
      },
      onDelete: (){

      },
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
              text: "Add New", onTap: (){
                Navigator.of(context).push(ScreenNavigation.createRoute(widget: const AddCouponScreen()));
            },fontSize: 14,)
          ],
        ),
      ),
    );
  }

  _handleSaveAttribute(AddAttributeRequestModel value) async{
    Loader.display(context);
    String? res = await catalogueProvider!.addAllAttribute(value);
    Loader.close(context);
    if(res == HttpResponseType.success){
      // navigatorKey.currentState!.pop();
      FlutterToastHelper.showToast("Attribute Added Successfully");
    }else{
      FlutterToastHelper.showToast(res??"");
    }
  }

  void _deleteAttribute()async{
    Loader.display(context);
    String? res = await catalogueProvider!.deleteAllAttribute(1);
    Loader.close(context);
    if(res == HttpResponseType.success){
      // navigatorKey.currentState!.pop();
      FlutterToastHelper.showToast("Attribute Delete Successfully");
    }else{
      FlutterToastHelper.showToast(res??"");
    }
  }

  void _showRemoveConfirmation(){
    AppDialogs.showAlertDialog(child:CommonConfirmationWidget(onYes: (){
      Navigator.pop(context);

    }, onNo: () async{
      Navigator.pop(context);
    },
      yesText: "Remove",
      noText: "Move to wishlist",
      title:  "Are you sure you want to remove this item?",));
  }


}
