// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
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
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/reset_password_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/flutter_toast_helper.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final TextEditingController _emailController = TextEditingController();
  String err = "";
  RegistrationProvider? _registrationProvider;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _registrationProvider = Provider.of<RegistrationProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppImages.redBackIcon,
        ),
        elevation: 0,
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget(){
    return SafeArea(
        child: Padding(
          padding: AppStyles.pd20,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppStyles.sbHeight30,
                AppImages.redAppLogo,
                AppStyles.sbHeight30,
                const PoppinsMediumText(text: "Forgot Password?", fontSize: 18,color: AppColors.textColor,),
                AppStyles.sbHeight60,
                _commonLabelAndTextFieldWidget("Email ID/Phone Number",_emailController,"Enter your mail ID",i_0,(value){}),
                AppStyles.sbHeight40,
                _continueButton(),
                AppStyles.sbHeight20,
                const Padding(
                  padding: AppStyles.pd20,
                  child: SubTitleText(text: "We have sent you an OTP on your registered phone number or email ID. Kindly verify the same to reset password",fontSize: 14,textAlign: TextAlign.center,color: AppColors.textColor),
                )
              ],
            ),
          ),
        )
    );
  }

  Widget _commonLabelAndTextFieldWidget(String labelText,TextEditingController controller,String hintText,int type,Function(String) onChange){
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
          keyboardType: TextInputType.emailAddress,
          inputFormatters: FilterFormatter.emailFilterFormatter,
          maxLength: 50,
          errorText: err,
        )
      ],
    );
  }


  Widget _continueButton(){
    return CommonAppButton(text: "continue", onTap: () async{
      // if(_emailController.text.isEmpty){
      //   err = "This field is required";
      // }else if(!AppRegex.emailRegex.hasMatch(_emailController.text)){
      //   err = "Please enter valid mail ID/phone number";
      // }else {
      //   err = "";
      // }
      // setState(() {});
      // if(err.isEmpty) {
      //   Loader.display(context);
      //   String? res = await _registrationProvider!.sendOTP(email: _emailController.text, type: 'email_verify_otp');
      //   Loader.close(context);
      //   if(res == HttpResponseType.success) {
          navigatorKey.currentState!.push(ScreenNavigation.createRoute(widget: OTPVerificationScreen(onResend: ()async{
            // Loader.display(context);
            // String? res = await _registrationProvider!.sendOTP(email: _emailController.text, type: 'email_verify_otp');
            // Loader.close(context);
            // if(res == HttpResponseType.success){
            //   FlutterToastHelper.showToast("OTP resend successfully");
            // }
           },
              onSubmit: (String otp) async{
             //    Loader.display(context);
             //    String? res = await _registrationProvider!.verifyOTP(email: _emailController.text, otp: otp,type: "email_verify_otp");
             //    Loader.close(context);
             // if(res == HttpResponseType.success) {
               navigatorKey.currentState!.pop();
               navigatorKey.currentState!.push(ScreenNavigation.createRoute(
                   widget:  ResetPasswordScreen(email: _emailController.text,)));
              //  }else{
              //  FlutterToastHelper.showToast(res??"");
              // }
            })
          ));
        // }else{
        //   FlutterToastHelper.showToast(res??"");
        // }
      // }
    });
  }
}
