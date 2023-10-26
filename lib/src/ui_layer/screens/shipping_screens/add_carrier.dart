import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/regex.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class AddCarrierScreen extends StatefulWidget {
  const AddCarrierScreen({Key? key, required this.isView}) : super(key: key);
  final bool isView;

  @override
  State<AddCarrierScreen> createState() => _AddCarrierScreenState();
}

class _AddCarrierScreenState extends State<AddCarrierScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController trackingUrlController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  File? logo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.isView ? "View Carrier" : "${true? 'Add' :'Edit'} Carrier",),
      body: _mainWidget(context),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: AppStyles.pd20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _commonLabelAndTextFieldWidget("Name",
                  _commonWidget(nameController, "",FilterFormatter.panCardFieldFormatter),
                  i_0
              ),
              AppStyles.sbHeight12,
              _commonLabelAndTextFieldWidget("Tracking URL",
                  _commonWidget(trackingUrlController, "",FilterFormatter.numberFieldFormatter),
                  i_0
              ),
              AppStyles.sbHeight12,
              _commonLabelAndTextFieldWidget("Phone",
                  _commonWidget(phoneController, "",FilterFormatter.numberFieldFormatter),
                  i_0
              ),
              AppStyles.sbHeight12,
              _commonLabelAndTextFieldWidget("Email",
                  _commonWidget(emailController, "",null),
                  i_0
              ),
              AppStyles.sbHeight12,
              if(!widget.isView)_buttonWidget(),
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
          padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
          text: "Save", onTap: (){
          // _handleTap();
        },fontSize: 16,)
      ],
    );
  }

  Widget _commonLabelAndTextFieldWidget(String labelText, Widget fieldWidget, int type){
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
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        AppStyles.sbHeight5,
        fieldWidget
      ],
    );
  }


  Widget _commonWidget(TextEditingController controller,String hintText,List<TextInputFormatter>? inputFormatters){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        // readOnly: widget.isView,
        controller: controller,
        inputFormatters: inputFormatters ,
        textCapitalization: TextCapitalization.characters,
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

