import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';

class CommonAppTextField extends StatelessWidget {
  const CommonAppTextField({Key? key, required this.controller, required this.hintText, required this.type, required this.onChange, this.suffixIcon, this.onSuffixTap, this.obscureText=false, this.inputFormatters, required this.maxLength,this.keyboardType = TextInputType.text, this.errorText="", this.allBorder = false}) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final int type;
  final Function(String) onChange;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String errorText;
  final bool allBorder;


  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      onChanged: (value){
        onChange(value);
      },
      decoration:  InputDecoration(
        errorText: errorText.isNotEmpty ? errorText:null,
        counterText: "",
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w300),
        focusedErrorBorder: !allBorder ? const UnderlineInputBorder( //<-- SEE HERE
          borderSide: BorderSide(
              width: 1, color: AppColors.borderColor),
        ):  _inputBorder(AppColors.borderColor),
        focusedBorder: !allBorder ? const UnderlineInputBorder( //<-- SEE HERE
          borderSide: BorderSide(
              width: 1, color: AppColors.borderColor),
        ):  _inputBorder(AppColors.borderColor),
        enabledBorder: !allBorder ? const UnderlineInputBorder( //<-- SEE HERE
          borderSide: BorderSide(
              width: 1, color: AppColors.borderColor),
        ):  _inputBorder(AppColors.borderColor),
        errorBorder: !allBorder ? const UnderlineInputBorder( //<-- SEE HERE
          borderSide: BorderSide(
              width: 1, color: AppColors.redColor),
        ):  _inputBorder(AppColors.redColor),
        suffixIcon: suffixIcon != null
            ? IconButton(
              onPressed: onSuffixTap ?? () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              splashRadius: d_1,
              icon: suffixIcon!,
            )
            : null,
      ),
    );
  }

  OutlineInputBorder _inputBorder(Color borderColor) {
    return  OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 0.5,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          4,
        ),
      ),
    );
  }
}

/// Widget used to display common search text field
class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.error = false,
    this.inputFormatters,
    this.onSubmitted,
    this.onChanged,
    this.focusNode,
    this.keyboardType,
    this.radius,
    this.name = false,
    this.obscureText = false,
    this.suffixIcon,
    this.filled = true,
    this.textCapitalization = TextCapitalization.words,
    this.readOnly = false,
    this.maxLength,
    this.enabled = true,
    this.prefixIcon,
    this.style,
    this.textInputAction,
    this.onTap,
    this.fillColor,
    this.onPrefixTap,
    this.onSuffixTap,
    this.prefixConstraints,
    this.maxLines = 1,
    this.minLines = 1,
    this.toolBarOptions = true,
    required this.fontColor,
    this.borderColor = AppColors.greyColor,
    this.height = 1.5,
    this.hintColor = AppColors.textColor,
    this.contentPadding
  }) : super(key: key);

  final Color fontColor;
  final TextEditingController? controller;
  final String hint;
  final bool error;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool name;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool filled;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final int? maxLength;
  final bool enabled;
  final TextStyle? style;
  final void Function()? onTap;
  final Color? fillColor;
  final void Function()? onPrefixTap;
  final void Function()? onSuffixTap;
  final double? radius;
  final BoxConstraints? prefixConstraints;
  final int maxLines;
  final int minLines;
  final bool toolBarOptions;
  final double height;
  final Color borderColor;
  final Color hintColor;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      obscureText: obscureText,
      obscuringCharacter: "*",
      enabled: true,
      onChanged: onChanged,
      maxLength: maxLength,
      onTap: onTap,
      onSubmitted: onSubmitted,
      cursorWidth: d_2,
      maxLines: maxLines,
      minLines: minLines,
      cursorRadius: const Radius.circular(d_20),
      controller: controller,
      scrollPhysics: const ClampingScrollPhysics(),
      style: style ?? TextStyle(color: AppColors.textColor, height:height, fontSize: 14),
      // cursorHeight: Platform.isIOS && !DeviceInfo.extraLargeDevice ? d_15 : d_20,
      textInputAction: textInputAction ?? TextInputAction.done,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      keyboardAppearance: Brightness.light,
      textCapitalization: textCapitalization,
      readOnly: readOnly,
      decoration: InputDecoration(
        counterText: "",
        filled: filled,
        fillColor: fillColor ?? AppColors.whiteColor,
        suffixIcon: SizedBox(
          height: 16,width: 16,
          child: InkWell(
              onTap: (){},
              child: AppImages.searchIcon),
        ),
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.textColor, height:height, fontSize: 12),
        focusedBorder: _inputBorder(borderColor),
        enabledBorder: _inputBorder(borderColor),
        isDense: true,
        border: _inputBorder(borderColor),
        contentPadding: contentPadding,
      ),
    );
  }

  OutlineInputBorder _inputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: error ? Colors.red : borderColor,
        width: 0.5,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          radius ?? 4,
        ),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.error = false,
    this.inputFormatters,
    this.onSubmitted,
    this.onChanged,
    this.focusNode,
    this.keyboardType,
    this.radius,
    this.name = false,
    this.obscureText = false,
    this.suffixIcon,
    this.filled = true,
    this.textCapitalization = TextCapitalization.words,
    this.readOnly = false,
    this.maxLength,
    this.enabled = true,
    this.prefixIcon,
    this.style,
    this.textInputAction,
    this.onTap,
    this.fillColor,
    this.onPrefixTap,
    this.onSuffixTap,
    this.prefixConstraints,
    this.maxLines = 1,
    this.minLines = 1,
    this.toolBarOptions = true,
    required this.fontColor,
    this.borderColor = AppColors.greyColor,
    this.height = 1.5,
    this.hintColor = AppColors.textColor,
    this.contentPadding
  }) : super(key: key);

  final Color fontColor;
  final TextEditingController? controller;
  final String hint;
  final bool error;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool name;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool filled;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final int? maxLength;
  final bool enabled;
  final TextStyle? style;
  final void Function()? onTap;
  final Color? fillColor;
  final void Function()? onPrefixTap;
  final void Function()? onSuffixTap;
  final double? radius;
  final BoxConstraints? prefixConstraints;
  final int maxLines;
  final int minLines;
  final bool toolBarOptions;
  final double height;
  final Color borderColor;
  final Color hintColor;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      obscureText: obscureText,
      obscuringCharacter: "*",
      enabled: true,
      onChanged: onChanged,
      maxLength: maxLength,
      onTap: onTap,
      onSubmitted: onSubmitted,
      cursorWidth: d_2,
      maxLines: maxLines,
      minLines: minLines,
      cursorRadius: const Radius.circular(d_20),
      controller: controller,
      scrollPhysics: const ClampingScrollPhysics(),
      style: style ?? TextStyle(color: AppColors.textColor, height:height, fontSize: 14),
      // cursorHeight: Platform.isIOS && !DeviceInfo.extraLargeDevice ? d_15 : d_20,
      textInputAction: textInputAction ?? TextInputAction.done,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      keyboardAppearance: Brightness.light,
      textCapitalization: textCapitalization,
      readOnly: readOnly,
      decoration: InputDecoration(
        counterText: "",
        filled: filled,
        fillColor: fillColor ?? AppColors.whiteColor,
        suffixIcon: InkWell(
            onTap: onSuffixTap,
            child: suffixIcon),
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.textColor, height:height, fontSize: 12),
        focusedBorder: _inputBorder(borderColor),
        enabledBorder: _inputBorder(borderColor),
        isDense: true,
        border: _inputBorder(borderColor),
        contentPadding: contentPadding,
      ),
    );
  }

  OutlineInputBorder _inputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: error ? Colors.red : borderColor,
        width: 0.5,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          radius ?? 4,
        ),
      ),
    );
  }
}
