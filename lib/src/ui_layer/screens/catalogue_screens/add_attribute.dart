import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/data_layer/models/catalogue_models/add_attribute_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/regex.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_dropdownWidget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class AddAttributeScreen extends StatefulWidget {
  const AddAttributeScreen({Key? key}) : super(key: key);

  @override
  State<AddAttributeScreen> createState() => _AddAttributeScreenState();
}

class _AddAttributeScreenState extends State<AddAttributeScreen> {

  final TextEditingController attributeTypeController = TextEditingController();
  final TextEditingController attributeNameController = TextEditingController();
  final TextEditingController listOrderController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  final List<String> attributeList = ['Color','Radio','Select'];

  bool activeValue = false;
  bool filterValue = false;
  String? selectedAttribute;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0,top: 20),
          child: PoppinsSemiBoldText(text: "Add Attribute", fontSize: 18,color: AppColors.textGreyColor,),
        ),
        AppStyles.sbHeight10,
        Container(
          height: 1,
          color: AppColors.blackTextColor,
        ),
        Padding(
          padding: AppStyles.pd20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppStyles.sbHeight10,
              _commonLabelAndTextFieldWidget("Attribute Type",_attributeTypeWidget(),i_0),
              AppStyles.sbHeight10,
              Row(
                children: [
                  Expanded(child: _commonLabelAndTextFieldWidget("Attribute Name",_attributeNameWidget(),i_0)),
                  AppStyles.sbWidth10,
                  Expanded(child: _commonLabelAndTextFieldWidget("List Order",_listOrderWidget(),i_0)),
                ],
              ),
              AppStyles.sbHeight10,
              _commonLabelAndTextFieldWidget("Categories",_categoryWidget(),i_0),
              AppStyles.sbHeight10,
              // _checkBoxWidget(),
              AppStyles.sbHeight10,
              _buttonWidget("Save"),
            ],
          ),
        )

      ],
    );
  }

  Widget _buttonWidget(String text){
    return InkWell(
      onTap: (){
        _handleSave();
      },
      child: Container(
        width: 110,
        padding: AppStyles.pd10,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.appMainColor,
          borderRadius: BorderRadius.circular(d_4),
        ),
        child: PoppinsBoldText(text: text,fontSize: 14,color: AppColors.whiteColor,),
      ),
    );
  }

  void _handleSave(){
    AddAttributeRequestModel addAttributeRequestModel =  AddAttributeRequestModel(
      attributeType: selectedAttribute,
      name: attributeNameController.text,
      order: listOrderController.text,
      categories: [1]
    );
    navigatorKey.currentState!.pop(addAttributeRequestModel);
  }
  
  Widget _checkBoxWidget(){
    return Row(
      children: [
        _activeWidget(),
        AppStyles.sbWidth10,
        _filterWidget(),
      ],
    );
  }

  Widget _filterWidget(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          width: 30,
          child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              fillColor: MaterialStateProperty.resolveWith ((Set  states) {
                if (states.contains(MaterialState.disabled)) {
                  return AppColors.appMainColor.withOpacity(.32);
                }
                return AppColors.appMainColor;
              }),
              checkColor: AppColors.whiteColor,
              value: filterValue,
              onChanged: (bool? value){
                filterValue = value!;
                setState(() {});
              }
          ),
        ),
        const PoppinsMediumText(text: "Filter",color: AppColors.appMainColor,fontSize: 14,)
      ],
    );
  }

  Widget _activeWidget(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
          width: 30,
          child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              fillColor: MaterialStateProperty.resolveWith ((Set  states) {
                if (states.contains(MaterialState.disabled)) {
                  return AppColors.appMainColor.withOpacity(.32);
                }
                return AppColors.appMainColor;
              }),
              checkColor: AppColors.whiteColor,
              value: activeValue,
              onChanged: (bool? value){
                activeValue = value!;
                setState(() {});
              }
          ),
        ),
        const PoppinsMediumText(text: "Active",color: AppColors.appMainColor,fontSize: 14,)
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
                  fontWeight: FontWeight.w500,
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

  Widget _attributeTypeWidget(){
    return CommonStateDropDownWidget(
        hintText: "Select Attribute Type",
        list: attributeList,
        selectedValue: selectedAttribute,
        onChangedFunction: (value){
          selectedAttribute = value;
          setState(() {});
        },
    );
  }

  Widget _categoryWidget(){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        controller: categoryController,
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

  Widget _listOrderWidget(){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        controller: listOrderController,
        inputFormatters: FilterFormatter.numberFieldFormatter,
        maxLength: 6,
        decoration: const InputDecoration(
          counterText: '',
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

  Widget _attributeNameWidget(){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        controller: attributeNameController,
        inputFormatters: FilterFormatter.nameFieldFormatter,
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
