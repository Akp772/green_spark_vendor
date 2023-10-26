import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_spark_vendor/src/business_layer/providers/stocks_provider.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/regex.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/bottom_sheets_widgets.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/image_picker_helper_widget.dart';
import 'package:provider/provider.dart';

class AddStockWithoutVariantScreen extends StatefulWidget {
  const AddStockWithoutVariantScreen({Key? key}) : super(key: key);

  @override
  State<AddStockWithoutVariantScreen> createState() => _AddStockWithoutVariantScreenState();
}

class _AddStockWithoutVariantScreenState extends State<AddStockWithoutVariantScreen> {

  File? file;
  TextEditingController skuController = TextEditingController();
  TextEditingController stockQtyController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController offerPriceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  StocksProvider? stocksProvider;

  @override
  Widget build(BuildContext context) {
    stocksProvider = Provider.of<StocksProvider>(context,listen: true);
    return Scaffold(
        appBar: const AppBarWidget(title: "Add inventory without variant",),
        body: _mainWidget());
  }


  Widget _mainWidget(){
    return Padding(
      padding: AppStyles.pd20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _featuredProductWidget(),
          AppStyles.sbHeight3,
          const CommonText(text: "Customer will be able to see this",fontSize: 14,color: AppColors.textGreyColor,),
          AppStyles.sbHeight10,
          _commonLabelAndTextFieldWidget('SKU *',skuController,i_6,"",FilterFormatter.nameFieldFormatter),
          AppStyles.sbHeight10,
          _commonLabelAndTextFieldWidget('Stock Quantity *',stockQtyController,i_6,"",FilterFormatter.numberFieldFormatter),
          AppStyles.sbHeight10,
          _commonLabelAndTextFieldWidget('Purchase Price *',purchasePriceController,i_7,"",FilterFormatter.numberFieldFormatter),
          AppStyles.sbHeight10,
          _commonLabelAndTextFieldWidget('Price *',priceController,i_8,"",FilterFormatter.nameFieldFormatter),
          AppStyles.sbHeight10,
          _commonLabelAndTextFieldWidget('Offer Price *',offerPriceController,i_8,"",FilterFormatter.nameFieldFormatter),
          AppStyles.sbHeight10,
          _buttonWidget(),
        ],
      ),
    );
  }

  Widget _buttonWidget(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubTitleText(text: "* Required fields",fontSize: 14,color: AppColors.textGreyColor,),
        CommonAppButtonWithDynamicWidth(
          padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
          text: "Save", onTap: (){
          // _handleTap();
        },fontSize: 16,)
      ],
    );
  }

  Widget _commonLabelAndTextFieldWidget(String labelText, TextEditingController controller, int type,String hintText,List<TextInputFormatter> inputFormatters){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text:  TextSpan(
            children: [
              TextSpan(
                text: labelText,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              // const TextSpan(text: '*', style: TextStyle(color: Colors.red)),

            ],
          ),
        ),
        AppStyles.sbHeight5,
        _commonTextField(controller,hintText: hintText, inputFormatters: inputFormatters)
      ],
    );
  }


  Widget _featuredProductWidget(){
    return  _commonDropdownWidgetWithLabel("Image",Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.textGreyColor,width: 0.5)
      ),
      child: Row(
        children: [
          _chooseFileWidget(i_0),
          AppStyles.sbWidth10,
          const Expanded(child: SubTitleText(text:  "No file chosen",fontSize: 16,color: AppColors.blackTextColor,overflow: TextOverflow.ellipsis,)),
        ],
      ),
    ));
  }


  Widget _commonTextField(TextEditingController controller,
      {List<TextInputFormatter>? inputFormatters,String hintText = ""}){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        controller: controller,
        inputFormatters: inputFormatters,
        decoration:  InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          hintText: hintText,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }


  Widget _commonDropdownWidgetWithLabel(String label,Widget widget){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PoppinsSemiBoldText(text: label, fontSize: 16,color: AppColors.textGreyColor,),
        AppStyles.sbHeight8,
        widget
      ],
    );
  }


  Widget _chooseFileWidget(int type){
    return InkWell(
      onTap: (){
        AppBottomSheets.commonAppBottomSheet(context, _actionSheetWidget(type));
      },
      child: Container(decoration: const BoxDecoration(
        color: AppColors.buttonBgColor,
      ),
        padding: AppStyles.pd10,
        child: const SubTitleText(text: "Choose File",fontSize: 16,color: AppColors.blackTextColor,),
      ),
    );
  }

  Widget _actionSheetWidget(int type) {
    return PickImageActionSheet(
      isProfile: false,
      title: "Select File",
      pickFile: (File file) async {

        setState(() {});
      },
    );
  }

  Future<void> _handleOnTap() async {
    String? res = await stocksProvider!.addStocksWithoutVariant(await _setRequest());

  }

  Future<FormData> _setRequest() async {
   return  FormData.fromMap({
      "product_id":9,
      "sku": skuController.text,
      "stock_qty": stockQtyController.text,
      "purchase_price": purchasePriceController.text,
      "price": priceController.text,
      "offer_price": offerPriceController.text,
      "featured_image": await MultipartFile.fromFile(file!.path),
    });
  }
}
