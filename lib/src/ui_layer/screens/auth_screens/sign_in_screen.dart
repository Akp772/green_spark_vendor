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
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/forgot_password_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/otp_verificationScreen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/flutter_toast_helper.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  RegistrationProvider? _registrationProvider;
  bool showPass = true;
  bool checkBox = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String emailErr = "";
  String passwordErr = "";

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

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
        title: const PoppinsBoldText(text: 'Sign In',color: AppColors.whiteColor, fontSize: 18,),
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
                AppStyles.sbHeight55,
                _commonLabelAndTextFieldWidget("Email ID/Phone Number",_emailController,"Enter your mail ID",i_0,(value){}),
                AppStyles.sbHeight30,
                _commonLabelAndTextFieldWidget("Enter Password",_passwordController,"Enter password ",i_2,(value){}),
                AppStyles.sbHeight6,
                _bottomRowWidget(),
                AppStyles.sbHeight30,
                _continueButton(),
              ],
            ),
          ),
        )
    );
  }

  void _checkValidation(){
    if(_passwordController.text.isEmpty){
      passwordErr = "This field is required";
    }else if(_passwordController.text.length < 6){
      passwordErr = "Password should be minimum 6 characters";
    }else{
      passwordErr = "";
    }
    if(_emailController.text.isEmpty){
      emailErr = "This field is required";
    }else if(!AppRegex.emailRegex.hasMatch(_emailController.text)){
      emailErr = "Please enter a valid email";
    }else{
      emailErr = "";
    }
    setState(() {});
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
          keyboardType:  type==i_0 ? TextInputType.emailAddress : ( type==i_1 ? TextInputType.number : TextInputType.text),
          inputFormatters: type==i_0 ? FilterFormatter.emailFilterFormatter :(type==i_1 ? FilterFormatter.numberFieldFormatter : FilterFormatter.passwordFieldFormatter),
          maxLength: type==i_0 ? 50 : (type==i_1  ? 10 : 20),
          suffixIcon: type==i_2 ? ( showPass? AppImages.openEyeIcon: AppImages.closeEyeIcon) : null,
          obscureText: type==i_2 && showPass,
          errorText: type==i_0 ? emailErr : passwordErr,
          onSuffixTap: (){
            showPass = !showPass;
            setState(() {});
          },
        )
      ],
    );
  }

  Widget _bottomRowWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Checkbox(
                  fillColor: MaterialStateProperty.resolveWith ((Set  states) {
                    if (states.contains(MaterialState.disabled)) {
                      return AppColors.appMainColor.withOpacity(.32);
                    }
                    return AppColors.appMainColor;
                  }),
                  checkColor: AppColors.whiteColor,
                  value: checkBox,
                  onChanged: (bool? value){
                    checkBox = value!;
                    setState(() {});
                  }
              ),
            ),
            const SubTitleText(text: "Remember Me",color: AppColors.textColor,textDecoration: TextDecoration.underline,)
          ],
        ),
        InkWell(
            onTap: (){
              navigatorKey.currentState!.push(ScreenNavigation.createRoute(widget: const ForgotPasswordScreen()));
            },
            child: const SubTitleText(text: "Forgot password?",color: AppColors.textColor))
      ],
    );
  }
  
  Widget _continueButton(){
    return CommonAppButton(text: "continue", onTap: (){
      _checkValidation();
      if(emailErr.isEmpty && passwordErr.isEmpty) {
        _handleTap(i_0);
      }
    });
  }

  void _handleTap(int type) async {
    Loader.display(context);
    String? res = await _registrationProvider!.login(email: _emailController.text, password: _passwordController.text,);
    Loader.close(context);
    if(res == HttpResponseType.success){
      navigatorKey.currentState!.pop();
      navigatorKey.currentState!.pop();
      if(type==i_1)navigatorKey.currentState!.pop();
    }else if(res == HttpResponseType.failed){
      _onFailed();
    }else{
      FlutterToastHelper.showToast(res??"");
    }
  }

  void _onFailed() async {
    Loader.display(context);
    String? res = await _registrationProvider!.sendOTP(email: _emailController.text, type: 'account__verify');
    Loader.close(context);
    if(res == HttpResponseType.success) {
      navigatorKey.currentState!.push(ScreenNavigation.createRoute(
          widget: OTPVerificationScreen(onResend: () async {
            Loader.display(context);
            String? res = await _registrationProvider!.sendOTP(
                email: _emailController.text, type: 'account__verify');
            Loader.close(context);
            if (res == HttpResponseType.success) {
              FlutterToastHelper.showToast("OTP resend successfully");
            }
          }, onSubmit: (String otp) {
            _handleVerifyOtp(otp);
          },)));
    }else{
      FlutterToastHelper.showToast(res??"");
    }
  }

  void _handleVerifyOtp(String otp) async{
    Loader.display(context);
    String? res = await _registrationProvider!.verifyOTP(email: _emailController.text,otp: otp);
    Loader.close(context);
    if(res == HttpResponseType.success){
      _handleTap(i_1);
    }else{
      FlutterToastHelper.showToast(res??"");
    }
  }

}
