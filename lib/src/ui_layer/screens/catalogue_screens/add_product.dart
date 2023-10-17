import 'dart:io';

import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/bottom_sheets_widgets.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/image_picker_helper_widget.dart';

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
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    children: [
                      _commonLabelAndTextFieldWidget('Name',_nameController,i_0),
                      AppStyles.sbHeight10,
                      _featuredProductWidget(),

                      // _commonLabelAndTextFieldWidget('Featured Image',_nameController,i_0),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Status',_statusController,i_1),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Categories',_categoryController,i_2),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Slug',_slugController,i_3),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Brand',_brandController,i_4),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Model Number',_modelNumberController,i_5),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Minimum Order Quantity',_minOrderQuantityController,i_6),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Weight',_weightController,i_7),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Meta Title',_metaTitleController,i_8),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Meta Description',_metaDescriptionController,i_9),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Linked Items',_linkedItemController,i_10),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Key Features',_keyFeaturedController,i_11),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Description',_descriptionController,i_12),
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
                onTap: (){},
                child:  const FittedBox(child: PoppinsSemiBoldText(text: "Add", fontSize: 14,color: AppColors.whiteColor,))
            ),AppColors.appMainColor
        )
      ],
    );
  }

  Widget _featuredProductWidget(){
    return  _commonDropdownWidgetWithLabel("Featured Image",Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textGreyColor,width: 0.5)
              ),
              child: Row(
                  children: [
                  _chooseFileWidget(),
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

  Widget _chooseFileWidget(){
    return InkWell(
      onTap: (){
        AppBottomSheets.commonAppBottomSheet(context, _actionSheetWidget());
      },
      child: Container(decoration: const BoxDecoration(
          color: AppColors.buttonBgColor,
      ),
        padding: AppStyles.pd10,
        child: const SubTitleText(text: "Choose File",fontSize: 16,color: AppColors.blackTextColor,),
      ),
    );
  }
  Widget _actionSheetWidget() {
    return PickImageActionSheet(
      isProfile: false,
      title: "Select File",
      pickFile: (File file) async {
        // this.file = file;
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


  Widget _commonLabelAndTextFieldWidget(String labelText, TextEditingController controller, int type){
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
        _commonTextField(controller)
      ],
    );
  }

  Widget _commonTextField(TextEditingController controller){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          hintText: "",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }


}
