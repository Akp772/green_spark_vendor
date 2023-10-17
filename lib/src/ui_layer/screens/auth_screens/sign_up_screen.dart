// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_spark_vendor/src/data_layer/models/auth_models/sign_up_request_model.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/sign_in_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/home_screens/home_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/other_screens/shop_details_form_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/app_logo_widget.dart';
import 'package:provider/provider.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/providers/registration_provider.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/progress_helper.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/regex.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/otp_verificationScreen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/sign_up_success_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/flutter_toast_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  RegistrationProvider? _registrationProvider;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _shopController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPass = true;
  bool showConfirmPass = true;
  String emailOrPhoneErr = "";
  String firstNameErr = "";
  String lastNameErr = "";
  String confirmPasswordErr = "";
  String passwordErr = "";
  String shopErr = "";
  String phoneErr = "";

  @override
  Widget build(BuildContext context) {
    _registrationProvider = Provider.of<RegistrationProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
        elevation: 0,
        centerTitle: true,
        leading: const SizedBox(),
        title: const PoppinsBoldText(text: 'Sign Up',color: AppColors.whiteColor, fontSize: 18,),
      ),
      body: SafeArea(child: _mainWidget(),),
    );
  }

  Widget _mainWidget(){
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Padding(
        padding: AppStyles.pd20,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const AppLogoWidget(isWhite: false,),
              AppStyles.sbHeight30,
              // _commonLabelAndTextFieldWidget("First Name",_firstNameController,"Enter your first name",i_0,(value){
              // },keyboardType: TextInputType.name,formatter: FilterFormatter.nameFieldFormatter,maxLen: 20,errText: firstNameErr),
              AppStyles.sbHeight30,
              _commonLabelAndTextFieldWidget("Name",_firstNameController,"Enter your name ",i_1,(value){
              },keyboardType: TextInputType.name,formatter: FilterFormatter.nameFieldFormatter,maxLen: 20,errText: firstNameErr),
              AppStyles.sbHeight30,
              _commonLabelAndTextFieldWidget("E-Mail ID ",_emailController,"Enter your mail ID",i_2,(value){
              },keyboardType: TextInputType.emailAddress,maxLen: 20,errText: emailOrPhoneErr),
              AppStyles.sbHeight30,
              _commonLabelAndTextFieldWidget("Phone Number",_phoneController,"Enter your phone number",i_2,(value){
              },keyboardType: TextInputType.number,maxLen: 10,errText: phoneErr),
              AppStyles.sbHeight30,
              _commonLabelAndTextFieldWidget("Password",_confirmPasswordController,"Enter password",i_3,(value){
              },keyboardType: TextInputType.text,formatter: FilterFormatter.passwordFieldFormatter,maxLen: 20,errText: passwordErr,obscureText: showPass,suffixIcon: showPass? AppImages.openEyeIcon:AppImages.closeEyeIcon),
              AppStyles.sbHeight30,
              _commonLabelAndTextFieldWidget("Confirm Password",_passwordController,"Re enter password",i_4,(value){
              },keyboardType: TextInputType.text,formatter: FilterFormatter.passwordFieldFormatter,maxLen: 20,errText: confirmPasswordErr,obscureText: showConfirmPass,suffixIcon: showConfirmPass? AppImages.openEyeIcon:AppImages.closeEyeIcon),
              AppStyles.sbHeight30,
              _commonLabelAndTextFieldWidget("Shop Name",_shopController,"Enter Shop Name",i_4,(value){
              },keyboardType: TextInputType.text,formatter: FilterFormatter.propertyNameFieldFormatter,maxLen: 20,errText: shopErr,),
              AppStyles.sbHeight55,
              _buttonWidget(),
              AppStyles.sbHeight30,
              _bottomTextWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomTextWidget(){
    return  RichText(
      text:   TextSpan(
        children: [
          const TextSpan(
            text: "Already have an account? ",
            style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap=(){
                  navigatorKey.currentState!.pushReplacement(ScreenNavigation.createRoute(widget: const SignInScreen()));
                },
              text: 'Sign In', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w700,)),
        ],
      ),
    );
  }


  void _checkValidation(){
    if(_firstNameController.text.isEmpty){
      firstNameErr = "This field is required";
    }else{
      firstNameErr = "";
    }
    // if(_lastNameController.text.isEmpty){
    //   lastNameErr = "This field is required";
    // }else{
    //   lastNameErr = "";
    // }
    if(_shopController.text.isEmpty){
      shopErr = "This field is required";
    }else{
      shopErr = "";
    }
    if(_phoneController.text.length != 10 && _phoneController.text.isNotEmpty){
      phoneErr = "Please enter a valid phone number";
    }else if(_phoneController.text.isEmpty){
      phoneErr = "This field is required";
    }else{
      phoneErr = "";
    }
    if(_passwordController.text.isEmpty){
      passwordErr = "This field is required";
    }else if(_passwordController.text.length <5){
      passwordErr = "Password should be minimum 6 characters";
    }else{
      passwordErr = "";
    }
    if(_passwordController.text.isNotEmpty && _passwordController.text.length >= 6 && _passwordController.text != _confirmPasswordController.text){
      confirmPasswordErr = "Password does not match";
    }else if(_confirmPasswordController.text.isEmpty){
      confirmPasswordErr = "This field is required";
    }else{
      confirmPasswordErr = "";
    }
    if(_emailController.text.isEmpty ){
      emailOrPhoneErr = "This field is required";
    }else if(_emailController.text.isNotEmpty && !AppRegex.emailRegex.hasMatch(_emailController.text)){
      emailOrPhoneErr = "Please enter a valid email address";
    }else{
      emailOrPhoneErr = "";
    }
    setState(() {});
  }


  Widget _commonLabelAndTextFieldWidget(String labelText,TextEditingController controller,String hintText,int type,Function(String) onChange,
      {TextInputType keyboardType = TextInputType.text,List<TextInputFormatter>? formatter,int maxLen = 50,Widget? suffixIcon,bool obscureText = false,String errText= ""}){
    return  Column(
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
                  fontSize: 14,
                ),
              ),
              const TextSpan(text: '*', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        CommonAppTextField(
            controller: controller,
            hintText: hintText,
            type: type,
            onChange: onChange,
            keyboardType:  keyboardType,
            inputFormatters: formatter,
            maxLength: maxLen,
            suffixIcon: suffixIcon,
            obscureText: obscureText,
            errorText: errText,
            onSuffixTap: (){
              if(type == i_3){
                showPass = !showPass;
              }else if(type == i_4){
                showConfirmPass = !showConfirmPass;
              }
              setState(() {});
            },
        )
      ],
    );
  }

  Widget _buttonWidget(){
    return CommonAppButton(text: "Register", onTap: (){
      _checkValidation();
      if(emailOrPhoneErr.isEmpty && phoneErr.isEmpty && passwordErr.isEmpty && lastNameErr.isEmpty && shopErr.isEmpty
          && confirmPasswordErr.isEmpty && firstNameErr.isEmpty) {
        // navigatorKey.currentState!.pushReplacement(ScreenNavigation.createRoute(
        //     widget:  const ShopDetailWidget()));
        _handleTap();
      }
      }
    );
  }

  void _handleTap() async{
    Loader.display(context);
    String? res = await _registrationProvider!.signUp(_setRequest());
    Loader.close(context);
    if(res == HttpResponseType.success){
      _onSuccess();
    }else{
      FlutterToastHelper.showToast(res??"");
    }
  }

   SignUpRequestModel _setRequest(){
    SignUpRequestModel signUpRequestModel = SignUpRequestModel()
        ..email = _emailController.text
        ..shopName = _shopController.text
        ..mobileNumber = int.parse(_phoneController.text)
        ..password = _passwordController.text
        ..name = _firstNameController.text
        ..countryCode = "+91"
        ..passwordConfirmation = _confirmPasswordController.text;
    return signUpRequestModel;

  }

  void _onSuccess(){
    Navigator.pushAndRemoveUntil(context, ScreenNavigation.createRoute(widget: const HomeScreen()), (route) => false);
  }
}
