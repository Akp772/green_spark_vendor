import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/network/api_constants.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/providers/catalogue_provider.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/progress_helper.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/add_attribute_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/all_attribute_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/home_models/all_product_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/catalogue_screens/add_attribute.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/catalogue_screens/add_product.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_dialog_widgets/app_dialogs.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_confirmation_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/table_widgets/common_table_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/flutter_toast_helper.dart';
import 'package:provider/provider.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({Key? key}) : super(key: key);

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {

  final TextEditingController controller = TextEditingController();

  int tabIndex = 0;
  CatalogueProvider? catalogueProvider;

  @override
  void initState() {
    _getAllProducts();
    super.initState();
  }

  void _getAllProducts(){
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      catalogueProvider = Provider.of<CatalogueProvider>(context,listen: false);
      catalogueProvider!.getAllProducts();
    });
  }

  void _getAttributes(){
    catalogueProvider!.getAllAttribute();
  }

  @override
  Widget build(BuildContext context) {
    catalogueProvider = Provider.of<CatalogueProvider>(context,listen: true);
    return Scaffold(
      body: _mainWidget(context),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            const CommonAppBarWidget(title: "Catalogue",isNotification: true),
             _topTabBarWidget(),
            _commonSearchWidget(),
            DataTableTopWidget(firstHeading: tabIndex==0?"Image":"Order",),
            Expanded(
                child: tabIndex == 0 ? _productListWidget() : _attributeListWidget(),
              ),
          ],
        )
    );
  }

  Widget _productListWidget(){
    return catalogueProvider!.allProductsResponseModel != null && catalogueProvider!.allProductsResponseModel!.context != null && catalogueProvider!.allProductsResponseModel!.context!.data != null ?ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context,index)=> _productDataWidget(index,catalogueProvider!.allProductsResponseModel!.context!.data![index]),
        separatorBuilder:  (context,index)=> const DividerWidget(),
        itemCount: catalogueProvider!.allProductsResponseModel!.context!.data!.length):const SizedBox();
  }

  Widget _productDataWidget(int index, Data data){
    return DataTableItemWidget(
      srNo: index+1,
      widget: Container(
        height: 60,width: 53,
        padding: AppStyles.pd2,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.textColor,width: 0.5)
        ),
        child: Image.network(
            "${ApiConstant.baseUrl}${data.featuredImage}",
            errorBuilder: (context,_,__) => const SizedBox.shrink(),
        ),
      ),
      nameText: data.name??"",
    );
  }


  Widget _attributeListWidget(){
    return catalogueProvider!.allAttributeResponseModel != null && catalogueProvider!.allAttributeResponseModel!.context != null && catalogueProvider!.allAttributeResponseModel!.context!.data != null ?ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context,index)=> _attributeDataWidget(index,catalogueProvider!.allAttributeResponseModel!.context!.data![index]),
        separatorBuilder:  (context,index)=> const DividerWidget(),
        itemCount: catalogueProvider!.allAttributeResponseModel!.context!.data!.length):const SizedBox();
  }

  Widget _attributeDataWidget(int index, AttributeData data,){
    return DataTableItemWidget(
      srNo: index+1,
      widget:  SubTitleText(text: data.listOrder??"",fontSize: 16,color: AppColors.blackTextColor,),
      nameText: data.attributeName??"",
    );
  }

  Widget _topTabBarWidget(){
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _commonTabBarItemWidget("Products",0),
          _commonTabBarItemWidget("Attributes",1),
        ],
      ),
    );
  }

  Widget _commonTabBarItemWidget(String text, int type){
    return Expanded(
      child: InkWell(
        onTap: (){
          tabIndex = type;
          if(tabIndex == 1){
            _getAttributes();
          }else{
            _getAllProducts();
          }
          setState(() {});
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: tabIndex==type ? AppColors.appMainColor : AppColors.whiteColor,
              border: Border.all(color: AppColors.appMainColor,width: 1)
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
                    controller: controller,
                    hint: "Search",
                    fontColor: AppColors.textColor
                ),
              ),
            ),
            AppStyles.sbWidth10,
            CommonAppButtonWithDynamicWidth(
              padding:  const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
              text:  tabIndex==0?"Add Product":"Add Attribute", onTap: (){
              if(tabIndex == 0){
                Navigator.push(context, ScreenNavigation.createRoute(widget: const AddProductScreen()));
              }else if(tabIndex == 1){
                 AppDialogs.showAlertDialog(child: const AddAttributeScreen()).then((value) {
                   if(value != null && value is AddAttributeRequestModel){
                     _handleSaveAttribute(value);
                   }
                   print('value ===>$value');
                 });
              }
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
