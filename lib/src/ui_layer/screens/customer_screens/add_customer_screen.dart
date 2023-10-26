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
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/bottom_sheets_widgets.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/image_picker_helper_widget.dart';
import 'package:provider/provider.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({Key? key}) : super(key: key);

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailIDController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();

  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  File? featuredImage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Add Customer',),
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
                      _commonLabelAndTextFieldWidget('Full Name *',_nameController,i_0,"",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Nickname *',_nicknameController,i_1,"",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Email ID *',_emailIDController,i_2,"",FilterFormatter.emailFilterFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('DOB *',_dobController,i_3,"",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('description *',_descriptionController,i_4,"",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Address line 1 *',_address1Controller,i_4,"",FilterFormatter.propertyNameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Address line 2',_address2Controller,i_6,"",FilterFormatter.propertyNameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('City *',_cityController,i_6,"",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                     _commonLabelAndTextFieldWidget('Zip/postal code *',_zipCodeController,i_6,"",FilterFormatter.numberFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Phone *',_phoneNumberController,i_7,"",FilterFormatter.numberFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('Country *',_countryController,i_8,"",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _commonLabelAndTextFieldWidget('State *',_stateController,i_9,"",FilterFormatter.nameFieldFormatter),
                      AppStyles.sbHeight10,
                      _avatarWidget(),
                      AppStyles.sbHeight10,
                    ],
                  ),
                ),
              ),
              AppStyles.sbHeight10,
              _buttonWidget(),
            ],
          ),
        )
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


  Widget _avatarWidget(){
    return  _commonDropdownWidgetWithLabel("Avatar",Container(
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
        }
        setState(() {});
      },
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


}
