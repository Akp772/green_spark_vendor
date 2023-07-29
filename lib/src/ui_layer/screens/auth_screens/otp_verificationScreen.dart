import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/regex.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_error_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key, required this.onResend, required this.onSubmit,}) : super(key: key);
  final VoidCallback onResend;
  final Function(String) onSubmit;

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {

  final TextEditingController _otpController = TextEditingController();
  String err = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: AppImages.redBackIcon,
        ),
      ),
      body: _mainWidget(),
    );
  }

  Widget _mainWidget(){
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Padding(
        padding: AppStyles.pd20,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppImages.redAppLogo,
                    AppStyles.sbHeight40,
                    const PoppinsMediumText(text: "OTP Verification", fontSize: 20,color: AppColors.textColor,),
                    AppStyles.sbHeight40,
                    AppImages.lockIcon,
                    AppStyles.sbHeight20,
                    const SubTitleText(text: "We have sent you an OTP on your registered email address. Kindly verify the same to proceed.",color: AppColors.textColor,textAlign: TextAlign.center,),
                    AppStyles.sbHeight20,
                    Padding(
                      padding: AppStyles.pdH35,
                      child: _otpTextFieldWidget(),
                    ),
                    if(err.isNotEmpty)CommonErrorWidget(errorText: err,),
                    AppStyles.sbHeight30,
                    const SubTitleText(text: "Didn’t receive an OTP?",color: AppColors.textColor,),
                    AppStyles.sbHeight20,
                    InkWell(
                        onTap: () {
                          _otpController.clear();
                          widget.onResend();
                        },
                        child: const PoppinsMediumText(text: "Resend OTP",color: AppColors.textColor,fontSize: 14,textDecoration: TextDecoration.underline,)),
                  ],
                ),
              ),
            ),
              CommonAppButton(text: "Submit",  onTap: () {
                print(_otpController.text.length);
                if(_otpController.text.length==4){
                  err = "";
                  widget.onSubmit(_otpController.text.toString());
                  setState(() {});
                }else{
                  if(_otpController.text.isEmpty){
                    err = "Please enter the OTP";
                  }else {
                    err = "Please enter a valid OTP";
                  }
                  setState(() {});
                }
              },),
            AppStyles.sbHeight20,
          ],
        ),
      ),
    );
  }

  Widget _otpTextFieldWidget(){
    return PinCodeTextField(
        controller: _otpController,
        appContext: context,
        length: 4,
        enableActiveFill: true,
        keyboardType : TextInputType.number,
        inputFormatters: FilterFormatter.numberFieldFormatter,
        mainAxisAlignment : MainAxisAlignment.spaceAround,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(6),
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth:0,
          activeFillColor: AppColors.otpFillColor.withOpacity(0.2),
          activeColor: AppColors.otpFillColor.withOpacity(0.2),
          disabledColor: AppColors.otpFillColor.withOpacity(0.2),
          selectedColor: AppColors.otpFillColor.withOpacity(0.2),
          selectedFillColor: AppColors.otpFillColor.withOpacity(0.2),
          inactiveFillColor: AppColors.otpFillColor.withOpacity(0.2),
          inactiveColor: Colors.transparent,
          errorBorderColor: AppColors.otpFillColor.withOpacity(0.2),
        ),
    );
  }

}
