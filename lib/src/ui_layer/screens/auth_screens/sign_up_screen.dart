// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPass = true;
  bool showConfirmPass = true;
  String emailOrPhoneErr = "";
  String firstNameErr = "";
  String lastNameErr = "";
  String confirmPasswordErr = "";
  String passwordErr = "";

  @override
  Widget build(BuildContext context) {
    _registrationProvider = Provider.of<RegistrationProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: AppImages.backIcon,
            ),
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
              AppStyles.sbHeight40,
              _commonLabelAndTextFieldWidget("First Name",_firstNameController,"Enter your first name",i_0,(value){
              },keyboardType: TextInputType.name,formatter: FilterFormatter.nameFieldFormatter,maxLen: 20,errText: firstNameErr),
              AppStyles.sbHeight30,
              _commonLabelAndTextFieldWidget("Last Name",_lastNameController,"Enter your last name ",i_1,(value){
              },keyboardType: TextInputType.name,formatter: FilterFormatter.nameFieldFormatter,maxLen: 20,errText: lastNameErr),
              AppStyles.sbHeight30,
              _commonLabelAndTextFieldWidget("E-Mail ID or Phone Number",_emailOrPhoneController,"Enter your mail ID or phone number",i_2,(value){
              },keyboardType: TextInputType.emailAddress,maxLen: 20,errText: emailOrPhoneErr),
              AppStyles.sbHeight30,
              _commonLabelAndTextFieldWidget("Password",_confirmPasswordController,"Enter password",i_3,(value){
              },keyboardType: TextInputType.text,formatter: FilterFormatter.passwordFieldFormatter,maxLen: 20,errText: passwordErr,obscureText: showPass,suffixIcon: showPass? AppImages.openEyeIcon:AppImages.closeEyeIcon),
              AppStyles.sbHeight30,
              _commonLabelAndTextFieldWidget("Confirm Password",_passwordController,"Re enter password",i_4,(value){
              },keyboardType: TextInputType.text,formatter: FilterFormatter.passwordFieldFormatter,maxLen: 20,errText: confirmPasswordErr,obscureText: showConfirmPass,suffixIcon: showConfirmPass? AppImages.openEyeIcon:AppImages.closeEyeIcon),
              AppStyles.sbHeight55,
              _buttonWidget()
            ],
          ),
        ),
      ),
    );
  }

  void _checkValidation(){

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
      // if(emailErr.isEmpty && phoneErr.isEmpty && passwordErr.isEmpty) {
        _handleTap();
      // }
    });
  }

  void _handleTap() async{
    // Loader.display(context);
    // String? res = await _registrationProvider!.signUp(email: _emailOrPhoneController.text, password: _passwordController.text, mobileNumber: _phoneNumberController.text);
    // Loader.close(context);
    // if(res == HttpResponseType.success){
      _onSuccess();
    // }else{
    //   FlutterToastHelper.showToast(res??"");
    // }
  }

  void _onSuccess(){
    navigatorKey.currentState!.push(ScreenNavigation.createRoute(
        widget:  OTPVerificationScreen(onResend: () async{
          Loader.display(context);
          String? res = await _registrationProvider!.sendOTP(email: _emailOrPhoneController.text, type: 'account__verify');
          Loader.close(context);
          if(res == HttpResponseType.success){
            FlutterToastHelper.showToast("OTP resend successfully");
          }
        }, onSubmit: (String otp) {
          _handleVerifyOtp(otp);
        },)));
  }

  void _handleVerifyOtp(String otp) async{
    // Loader.display(context);
    // String? res = await _registrationProvider!.verifyOTP(email: _emailOrPhoneController.text,otp: otp);
    // Loader.close(context);
    // if(res == HttpResponseType.success){
      navigatorKey.currentState!.pop();
      navigatorKey.currentState!.pushReplacement(ScreenNavigation.createRoute(
          widget:  const SignUPSuccessScreen())
      );
    // }else{
    //   FlutterToastHelper.showToast(res??"");
    // }
  }
}
