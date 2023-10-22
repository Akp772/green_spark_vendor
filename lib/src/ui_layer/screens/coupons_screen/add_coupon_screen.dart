import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/network/request_response_type.dart';
import 'package:green_spark_vendor/src/business_layer/providers/coupons_provider.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/progress_helper.dart';
import 'package:green_spark_vendor/src/data_layer/models/coupon_models/add_coupon_request_model.dart';
import 'package:green_spark_vendor/src/data_layer/models/coupon_models/coupons_list_response_model.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/regex.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_dropdownWidget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/flutter_toast_helper.dart';
import 'package:provider/provider.dart';

class AddCouponScreen extends StatefulWidget {
  const AddCouponScreen({Key? key, this.couponData, this.isView=false,}) : super(key: key);
  final CouponsData? couponData;
  final bool isView;
  @override
  State<AddCouponScreen> createState() => _AddCouponScreenState();
}

class _AddCouponScreenState extends State<AddCouponScreen> {

  final TextEditingController codeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController numberOfCouponsController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController couponsStatusController = TextEditingController();
  CouponsProvider? couponsProvider;
  String? couponType;
  String? couponStatus;

  @override
  void initState() {
    if(widget.couponData != null)_setData();
    super.initState();
  }

  void _setData(){
    codeController.text = widget.couponData!.code??"";
    amountController.text = widget.couponData!.amount??"";
    numberOfCouponsController.text = widget.couponData!.noOfCoupons??"";
    expiryDateController.text = widget.couponData!.expiryDate??"";
    couponType = widget.couponData!.couponType??"";
  }

  @override
  Widget build(BuildContext context) {
    couponsProvider = Provider.of<CouponsProvider>(context,listen: true);
     return Scaffold(
          appBar: AppBarWidget(title: widget.isView ? "View Coupon" : "${widget.couponData == null? 'Add' :'Edit'} Coupon",),
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
              _commonLabelAndTextFieldWidget("Code *",
                  _commonWidget(codeController, "",FilterFormatter.panCardFieldFormatter),
                  i_0
              ),
              const SubTitleText(text: "Customer will be able to see this",fontSize: 12,color: AppColors.textGreyColor,),
              AppStyles.sbHeight12,
              _commonLabelAndTextFieldWidget("Coupon Type *",
                  _couponTypeWidget(),
                  i_0
              ),
              AppStyles.sbHeight12,
              _commonLabelAndTextFieldWidget("Amount *",
                  _commonWidget(amountController, "",FilterFormatter.numberFieldFormatter),
                  i_0
              ),
              AppStyles.sbHeight12,
              _commonLabelAndTextFieldWidget("Number Of Coupons * ",
                  _commonWidget(numberOfCouponsController, "",FilterFormatter.numberFieldFormatter),
                  i_0
              ),
              AppStyles.sbHeight12,
              _commonLabelAndTextFieldWidget("Expiry date * ",
                  _commonWidget(expiryDateController, "",null),
                  i_0
              ),
              AppStyles.sbHeight12,
              _commonLabelAndTextFieldWidget("Coupon Status *",
                  _couponStatusWidget(),
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
          text: "Update", onTap: (){
          _handleTap();
        },fontSize: 16,)
      ],
    );
  }

  void _handleTap() async {
    Loader.display(context);
    String? res = await couponsProvider!.addCoupons(_setRequest(),widget.couponData != null ? widget.couponData!.id : null);
    Loader.close(context);
    if(res == HttpResponseType.success){
      FlutterToastHelper.showToast("Coupon ${widget.couponData != null ? "updated" :"added"} successfully");
      navigatorKey.currentState!.pop();
    }else{
      FlutterToastHelper.showToast(res??"");
    }

  }

  AddCouponRequestModel _setRequest(){
    AddCouponRequestModel addCouponRequestModel = AddCouponRequestModel()
        ..code = codeController.text
        ..noOfCoupons = int.parse(numberOfCouponsController.text)
        ..expiryDate = expiryDateController.text
        ..couponType = couponType
        ..amount = int.parse(amountController.text);
    return addCouponRequestModel;
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

  Widget _couponTypeWidget(){
    return CommonStateDropDownWidget(
      hintText: "Select Coupon Type",
      list: const ["fixed"],
      selectedValue: couponType,
      onChangedFunction: widget.isView? null :(value){
        couponType = value;
        setState(() {});
      },
    );
  }

  Widget _couponStatusWidget(){
    return CommonStateDropDownWidget(
      hintText: "Select Coupon Status",
      list: const ["publish"],
      selectedValue: couponStatus,
      onChangedFunction: widget.isView ? null : (value){
        couponStatus = value;
        setState(() {});
      },
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
        readOnly: widget.isView,
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
