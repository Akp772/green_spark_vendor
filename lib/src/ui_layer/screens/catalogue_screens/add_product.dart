import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/providers/catalogue_provider.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/device_info_helper.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/progress_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/regex.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/bottom_sheets_widgets.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/image_picker_helper_widget.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _slugController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelNumberController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final TextEditingController _minOrderQuantityController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _metaTitleController = TextEditingController();
  final TextEditingController _metaDescriptionController = TextEditingController();
  final TextEditingController _linkedItemController = TextEditingController();
  final TextEditingController _keyFeaturedController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  File? featuredImage;
  File? galleryImage;
  CatalogueProvider? catalogueProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    catalogueProvider = Provider.of<CatalogueProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appMainColor,
        title: const PoppinsSemiBoldText(text: 'Add Product',fontSize: 18,color: AppColors.whiteColor,),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              navigatorKey.currentState!.pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: AppImages.backIcon,
            )),
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget() {
    return SafeArea(
        child: Padding(
          padding: AppStyles.pd20,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _commonLabelAndTextFieldWidget('Name',_nameController,i_0,"Product Name",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _featuredProductWidget(),
                      // _commonLabelAndTextFieldWidget('Featured Image',_nameController,i_0),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Status',_statusController,i_1,"",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _galleryProductWidget(),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Categories',_categoryController,i_2,"",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _checkBoxWidget("Requires Shipping",i_0),
                          _checkBoxWidget("Has variant",i_1),
                        ],
                      ),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Slug',_slugController,i_3,"",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Brand',_brandController,i_4,"",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonWidget('Tags',_commonTextAreaField(_tagController),i_5),
                      AppStyles.sbHeight10,
                      const PoppinsMediumText(text: "Dimensions", fontSize: 16,color: AppColors.textColor,),
                      AppStyles.sbHeight5,
                      _dimensionWidget(),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Model Number',_modelNumberController,i_6,"",FilterFormatter.numberFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Minimum Order Quantity',_minOrderQuantityController,i_6,"",FilterFormatter.numberFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Weight',_weightController,i_7,"Product Name",FilterFormatter.numberFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Meta Title',_metaTitleController,i_8,"Product Name",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Meta Description',_metaDescriptionController,i_9,"Product Name",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Linked Items',_linkedItemController,i_10,"Product Name",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Key Features',_keyFeaturedController,i_11,"Product Name",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Description',_descriptionController,i_12,"Product Name",FilterFormatter.nameFieldFormatter),
                    ],
                  ),
                ),
              ),
              AppStyles.sbHeight10,
              _bottomButtonsWidget(),
            ],
          ),
        )
    );
  }

  Widget _checkBoxWidget(String title,int type){
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value){

        }),
        PoppinsSemiBoldText(text: title, fontSize: 14,color: AppColors.textGreyColor,)
      ],
    );
  }

  Widget _bottomButtonsWidget(){
    return  Row(
      children: [
        _commonButton(
            InkWell(
                onTap: (){},
                child:  const FittedBox(child: PoppinsSemiBoldText(text: "Cancel", fontSize: 14,color: AppColors.appMainColor,))
            ), AppColors.whiteColor
        ),
        AppStyles.sbWidth10,
        _commonButton(
            InkWell(
                onTap: (){
                  _handleOnTap();
                },
                child:  const FittedBox(child: PoppinsSemiBoldText(text: "Add", fontSize: 14,color: AppColors.whiteColor,))
            ),AppColors.appMainColor
        )
      ],
    );
  }

  void _handleOnTap() async {
     Loader.display(context);
     String? res = await catalogueProvider!.addProducts(await _setRequest());
     Loader.close(context);
  }

  Future<FormData> _setRequest() async {
    FormData formData =  FormData.fromMap({
        "name": _nameController.text,
        "status": _statusController.text,
        "description": _descriptionController.text,
        "requires_shipping": "true",
        "has_variant": "true",
        "brand": _brandController.text,
        "model_number": _modelNumberController.text,
        "slug": _slugController.text,
        "min_order_qty": _minOrderQuantityController.text,
        "key_features": _keyFeaturedController.text,
        "tags": _tagController.text,
        "weight": _weightController.text,
        "linked_items": _linkedItemController.text,
        "meta_title": _metaTitleController.text,
        "meta_description": _metaDescriptionController.text,
        "gallery_images": await MultipartFile.fromFile(galleryImage!.path),
        "featured_image":  await MultipartFile.fromFile(featuredImage!.path),
        "categories": ['1'],
        "length": _lengthController.text,
        "width": _widthController.text,
        "height": _heightController.text,
    });
    return formData;
  }

  Widget _featuredProductWidget(){
    return  _commonDropdownWidgetWithLabel("Featured Image",Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textGreyColor,width: 0.5)
              ),
              child: Row(
                  children: [
                  _chooseFileWidget(i_0),
                  AppStyles.sbWidth10,
                 const Expanded(child: SubTitleText(text:  "",fontSize: 16,color: AppColors.blackTextColor,overflow: TextOverflow.ellipsis,)),
              ],
      ),
    ));
  }

  Widget _galleryProductWidget(){
    return  _commonDropdownWidgetWithLabel("Gallery Image",Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textGreyColor,width: 0.5)
              ),
              child: Row(
                  children: [
                  _chooseFileWidget(i_1),
                  AppStyles.sbWidth10,
                const Expanded(child: SubTitleText(text:  "",fontSize: 16,color: AppColors.blackTextColor,overflow: TextOverflow.ellipsis,)),
              ],
      ),
    ));
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
        // this.file = file;
        if(type==0){
          featuredImage = file;
        }else{
          galleryImage = file;
        }
        setState(() {});
      },
    );
  }



  Widget _commonButton(Widget widget,Color color){
    return Expanded(
      child: Container(
        height: 40,
        padding: AppStyles.pdV9,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: AppColors.appMainColor,width: 1)
        ),
        child: Align(
            alignment:Alignment.center,child: widget),
      ),
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

  Widget _commonWidget(String labelText, Widget widget, int type){
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
        widget
      ],
    );
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

  Widget _commonTextAreaField(TextEditingController controller){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        controller: controller,
        maxLines: 4,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          hintText: "Enter Tags",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _dimensionWidget(){
    return Row(
      children: [
        SizedBox(
            width: (DeviceInfo.width-60)/3,
            child: _commonTextField(
                _heightController,hintText: "Height",inputFormatters: FilterFormatter.numberFieldFormatter
            )),
        AppStyles.sbWidth10,
        SizedBox(
            width: (DeviceInfo.width-60)/3,
            child: _commonTextField(_widthController,hintText: "Width",inputFormatters: FilterFormatter.numberFieldFormatter)),
        AppStyles.sbWidth10,
        SizedBox(
            width: (DeviceInfo.width-60)/3,
            child: _commonTextField(_lengthController,hintText: "Length",inputFormatters: FilterFormatter.numberFieldFormatter)),
      ],
    );
  }


}
