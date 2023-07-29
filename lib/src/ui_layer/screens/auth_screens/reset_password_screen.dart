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
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/password_reset_success_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/auth_screens/sign_up_type_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/flutter_toast_helper.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPass = true;
  bool showConfirmPass = true;
  String newPassErr = "";
  String confirmPassErr = "";
  RegistrationProvider? _registrationProvider;

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _passwordController.dispose();
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
                const PoppinsMediumText(text: "Reset Password", fontSize: 18,color: AppColors.textColor,),
                AppStyles.sbHeight60,
                _commonLabelAndTextFieldWidget("Enter Password",_passwordController,"Enter Password",i_0,(value){}),
                AppStyles.sbHeight20,
                _commonLabelAndTextFieldWidget("Confirm Password",_confirmPasswordController,"Enter Confirm Password",i_1,(value){}),
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
        PoppinsMediumText(text: labelText, fontSize: 14,color: AppColors.textColor,),
        CommonAppTextField(
          controller: controller,
          hintText: hintText,
          type: type,
          onChange: onChange,
          keyboardType: TextInputType.text,
          inputFormatters: FilterFormatter.passwordFieldFormatter,
          maxLength: 20,
          suffixIcon: type==i_0 ?(showPass? AppImages.openEyeIcon: AppImages.closeEyeIcon): (showConfirmPass ? AppImages.openEyeIcon: AppImages.closeEyeIcon),
          obscureText: type==i_0 ? showPass : showConfirmPass,
          errorText: type==i_0 ? newPassErr : confirmPassErr,
          onSuffixTap: (){
            if(type==i_0){
              showPass = !showPass;
            }else if(type==i_1){
              showConfirmPass = !showConfirmPass;
            }
            setState(() {});
          },
        )
      ],
    );
  }


  Widget _continueButton(){
    return CommonAppButton(text: "Submit", onTap: () async{
      // _checkValidation();
      // if(newPassErr.isEmpty && confirmPassErr.isEmpty){
        // Loader.display(context);
        // String? res = await _registrationProvider!.forgotPassword(email: widget.email, password: _passwordController.text);
        // // ignore: use_build_context_synchronously
        // Loader.close(context);
        // if(res==HttpResponseType.success){
          navigatorKey.currentState!.pushReplacement(ScreenNavigation.createRoute(widget: const PasswordResetSuccessScreen()));
      //   }else{
      //     FlutterToastHelper.showToast(res??"");
      //   }
      // }
    });
  }

  void _checkValidation(){
    if(_passwordController.text.isEmpty){
      newPassErr = "This field is required";
    }else if(_passwordController.text.length < 6){
      newPassErr = "Please enter valid password";
    }else{
      newPassErr = "";
    }
    if(_confirmPasswordController.text.isEmpty){
      confirmPassErr = "This field is required";
    }else if(_confirmPasswordController.text.length < 6){
      confirmPassErr = "Please enter valid password";
    }else if(_confirmPasswordController.text != _passwordController.text){
      confirmPassErr = "Password does not match";
    }else{
      confirmPassErr = "";
    }
    setState(() {});
  }
}
