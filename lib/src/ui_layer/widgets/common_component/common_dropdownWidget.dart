
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class CommonStateDropDownWidget extends StatefulWidget {
  const CommonStateDropDownWidget({
    Key? key,
    required this.hintText,
    this.list = const [],
    this.color = AppColors.whiteColor,
    this.rightIconPadding = d_14,
    this.borderRadius = d_3,
    this.hintColor,
    this.leftPadding = 9,
    this.isPressed,
    this.selectedValueFunction,
    this.rightIcon,
    this.fontColor = AppColors.textGreyColor,
    this.borderColor = AppColors.textGreyColor,
    this.isComingFromOccupationScreen = false,this.isSearchRequired = false,
    this.onChangedFunction,
    this.selectedValue,
    this.isPressedFunction,this.searchText = "Select State",
  }) : super(key: key);
  final String hintText;
  final List<String> list;
  final Color color;
  final double borderRadius;
  final double rightIconPadding;
  final Color? hintColor;
  final double leftPadding;
  final Widget? rightIcon;
  final Function(bool)? isPressed;
  final Color fontColor;
  final Color borderColor;
  final bool isComingFromOccupationScreen;
  final String? selectedValue;
  final bool isSearchRequired;
  final String searchText;

  ///callBack Function
  final Function(int)? selectedValueFunction;
  final Function(dynamic)? onChangedFunction;
  final Function(bool?)? isPressedFunction;

  @override
  State<CommonStateDropDownWidget> createState() => _CommonStateDropDownWidget();
}

class _CommonStateDropDownWidget extends State<CommonStateDropDownWidget> {

  final TextEditingController textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return _mainWidget();
  }

  /// main widget
  Widget _mainWidget() {
    String? value = widget.selectedValue;
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
            if(widget.isPressedFunction != null)widget.isPressedFunction!(isOpen);
          },
          isExpanded: true,
          iconStyleData: const IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down,color: AppColors.blackTextColor,)
          ),
          hint: PoppinsMediumText(
            text: widget.hintText,
            fontSize: d_14,
            color: widget.hintColor ??
                AppColors.textGreyColor.withOpacity(0.5),
          ),
          items: widget.list
              .map(
                (item) => DropdownMenuItem<String>(
              value: item,
              child: PoppinsMediumText(
                text: item,
                fontSize: d_14,
                color: AppColors.textColor,
              ),
            ),
          )
              .toList(),

          ///for occupation screen
          buttonStyleData: ButtonStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: AppColors.greyColor.withOpacity(0.2),
              ),
              color: widget.color,
            ),
            elevation: 0,
          ),
          value: value,
          onChanged: widget.onChangedFunction != null ? (value){
            widget.onChangedFunction!(value);
          } : null,
      ),
    );
  }
}