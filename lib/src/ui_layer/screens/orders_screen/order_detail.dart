import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/device_info_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/table_widgets/common_table_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    return _mainWidget();
  }

  Widget _mainWidget(){
    return Scaffold(
      appBar: const AppBarWidget(title: 'Orders',),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topWidget(),
            _itemWidget(),
            _commonContainer(child: _priceDetailWidget()),
            AppStyles.sbHeight5,
            _commonContainer(child: _totalAmountWidget("20")),
            _buttonsWidget("Update Status","Fulfill Order",(){},(){}),
            AppStyles.sbHeight5,
            _addressDetailWidget(),
          ],
        ),
      ),
    );
  }

  Widget _commonContainer({required Widget child}){
    return Container(
        padding: AppStyles.pdH20V16,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.textColor,width: 0.5),
            borderRadius: BorderRadius.circular(4)
        ),
        child:child
    );
  }
  Widget _topWidget(){
    return Padding(
      padding: AppStyles.pd20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PoppinsSemiBoldText(text: "Order ID - #710191", fontSize: 16,color: AppColors.textGreyColor,),
          AppStyles.sbHeight10,
          _labelWidget("Payment Method","Paypal"),
          AppStyles.sbHeight5,
          _labelWidget("Payment Status","Processing"),
        ],
      ),
    );
  }

  Widget _labelWidget(String label,String value){
    return Row(
      children: [
        PoppinsMediumText(text: "$label- ", fontSize: 16,color: AppColors.textGreyColor,),
        Container(
          padding: AppStyles.pd4,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.textGreyColor,width: 0.5)
          ),
          child: SubTitleText(text: value,color: AppColors.textGreyColor,fontSize: 14,),
        )
      ],
    );
  }

  Widget _itemWidget(){
    return Column(
      children: [
        Container(
          color: AppColors.tableBgColor,
          padding: AppStyles.pdH20V16,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubTitleText(text: "Men Red Shirt",fontSize: 14,color: AppColors.textGreyColor,),
              SubTitleText(text: "USD 772 X 1",fontSize: 14,color: AppColors.textGreyColor,),
            ],
          ),
        ),
        Padding(
          padding: AppStyles.pd20,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: _commonBorderContainer(_imageWidget())),
              AppStyles.sbWidth10,
              Expanded(
                  flex: 3,
                  child: _commonBorderContainer(_detailWidget())),
            ],
          ),
        ),
      ],
    );
  }

  Widget _imageWidget(){
    return SizedBox(

    );
  }

  Widget _profileWidget(){
    return  Padding(
      padding: AppStyles.pd20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              false ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                //   image: DecorationImage(
                //       // image: NetworkImage("${_profileProvider!.getProfileResponseModel!.context!.data!.first.profileUrl}"),
                //       fit: BoxFit.cover),
                // ),
                // height: 57,width: 57,
              )) : SizedBox(
                  height: 57,width: 57,
                  child: AppImages.profileDemoImh),
              AppStyles.sbWidth6,
              PoppinsSemiBoldText(text: "Name", fontSize: 16,color: AppColors.blackTextColor,)
            ],
          ),
          AppStyles.sbHeight5,
          const PoppinsMediumText(text: "Email : dummyemail@gmail.com", fontSize: 14,color: AppColors.textGreyColor,),
          AppStyles.sbHeight10,
          _buttonsWidget("Send Message","Invoice",(){},(){},type: 1),
        ],
      ),
    );
  }

  Widget _buttonsWidget(String text1,String text2,VoidCallback onTap1,VoidCallback onTap2,{int type = 0}){
    return Padding(
      padding: type == 0 ? AppStyles.pdH20V12 : AppStyles.pd0,
      child: Row(
        mainAxisAlignment: type == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          CommonAppButtonWithDynamicWidth(
              fontSize: 14,
              buttonColor: AppColors.textGreyColor,
              text: text1,
              onTap: onTap1
          ),
          AppStyles.sbWidth10,
          CommonAppButtonWithDynamicWidth(
              fontSize: 14,
              buttonColor: AppColors.lightBlueThirdColor,
              text: text2,
              onTap: onTap2
          ),
        ],
      ),
    );
  }

  Widget _addressDetailWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: DeviceInfo.width,
          color: AppColors.tableBgColor,
          padding: AppStyles.pdH20V16,
          child: const PoppinsMediumText(text: "Customer Details",fontSize: 16,color: AppColors.textGreyColor,),
        ),
         AppStyles.sbHeight5,
         const DividerWidget(),
        AppStyles.sbHeight5,
        _profileWidget(),
        _addressWidget()
      ],
    );
  }

  Widget _priceDetailWidget({int type = 0}){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PoppinsSemiBoldText(text: "PRICE DETAILS (2 ITEMS)", fontSize: 14,color: AppColors.textGreyColor,),
        AppStyles.sbHeight20,
        _priceDetailItemWidget("Total MRP","USD \$34"),
        AppStyles.sbHeight10,
        _priceDetailItemWidget("Discount on MRP","-USD \$77",valueColor: AppColors.greenColor),
        AppStyles.sbHeight10,
        _priceDetailItemWidget("Coupon Discount","\$77",valueColor: AppColors.lightBlueSecondColor),
        AppStyles.sbHeight10,
        _priceDetailItemWidget("Shipping Charges","Free",valueColor: AppColors.greenColor),
      ],
    );
  }
  Widget _priceDetailItemWidget(String label,String text, {Color valueColor = AppColors.textColor}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SubTitleText(text: label,fontSize: 14,color: AppColors.textColor,),
        SubTitleText(text: text,fontSize: 14,color: valueColor,),
      ],
    );
  }

  Widget _totalAmountWidget(String? totalAmount){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const PoppinsBoldText(text: "Total Amount",fontSize: 14,color: AppColors.textColor,),
        PoppinsBoldText(text: "USD ${totalAmount??"N/A"}",fontSize: 14,color: AppColors.greenColor),
      ],
    );
  }

  Widget _addressWidget(/*String addressLabel,String addressText,String addressDetail,String mobileNumber*/){
    return Padding(
      padding: AppStyles.pd20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PoppinsMediumText(text: "Shipping Address",fontSize: 16,color: AppColors.textColor,),
          AppStyles.sbHeight10,
          // PoppinsMediumText(text: "${_homeProvider!.orderDetailResponseModel!.context!.data!.orderDetails!.shippingAddress!.address}",fontSize: 14,color: AppColors.textColor,),
          AppStyles.sbHeight5,
          // PoppinsMediumText(text: "${_homeProvider!.orderDetailResponseModel!.context!.data!.orderDetails!.shippingAddress!.city}, ${_homeProvider!.orderDetailResponseModel!.context!.data!.orderDetails!.shippingAddress!.state}, ${_homeProvider!.orderDetailResponseModel!.context!.data!.orderDetails!.shippingAddress!.city}-${_homeProvider!.orderDetailResponseModel!.context!.data!.orderDetails!.shippingAddress!.zipCode}",fontSize: 14,color: AppColors.textColor,height: 1.2,),
          AppStyles.sbHeight5,
          RichText(
              text:  TextSpan(
                  children: [
                    const TextSpan(
                      text: "mobile - ",
                      style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.blackTextColor),
                    ),
                    // TextSpan(
                    //   text: "${_homeProvider!.orderDetailResponseModel!.context!.data!.orderDetails!.shippingAddress!.contactNo}",
                    //   style:  const TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.textColor),
                    // )
                  ]
              )
          ),
          AppStyles.sbHeight20,
          _billingAddress()
        ],
      ),
    );
  }

  Widget _billingAddress(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PoppinsMediumText(text: "Billing Address",fontSize: 16,color: AppColors.textColor,),
        AppStyles.sbHeight10,
        // PoppinsMediumText(text: "${_homeProvider!.orderDetailResponseModel!.context!.data!.orderDetails!.billingAddress!.address}",fontSize: 14,color: AppColors.textColor,),
        AppStyles.sbHeight5,
        // PoppinsMediumText(text: "${_homeProvider!.orderDetailResponseModel!.context!.data!.orderDetails!.billingAddress!.city}, ${_homeProvider!.orderDetailResponseModel!.context!.data!.orderDetails!.billingAddress!.state}, ${_homeProvider!.orderDetailResponseModel!.context!.data!.orderDetails!.billingAddress!.city}-${_homeProvider!.orderDetailResponseModel!.context!.data!.orderDetails!.billingAddress!.zipCode}",fontSize: 14,color: AppColors.textColor,height: 1.2,),
        AppStyles.sbHeight5,
        RichText(
            text:  TextSpan(
                children: [
                  const TextSpan(
                    text: "mobile - ",
                    style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.blackTextColor),
                  ),
                  // TextSpan(
                  //   text: "${_homeProvider!.orderDetailResponseModel!.context!.data!.orderDetails!.billingAddress!.contactNo}",
                  //   style:  const TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: AppColors.textColor),
                  // )
                ]
            )
        )
      ],
    );
  }

  Widget _detailWidget(){
    return Column(
      children: [
        _rowWidget("MRP","USD 772"),
        _rowWidget("Discount on MRP","-USD 121"),
        _rowWidget("Coupon Discount","USD 772"),
        _rowWidget("Shipping Charges","USD 772"),
        _rowWidget("Gross Total","USD 772"),
      ],
    );
  }

  Widget _rowWidget(String label,String value){
    return Padding(
      padding: AppStyles.pdV6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SubTitleText(text: label,color: AppColors.blackTextColor,fontSize: 14,),
          SubTitleText(text: value,color: AppColors.blackTextColor,fontSize: 14,),
        ],
      ),
    );
  }


  Widget _commonBorderContainer(Widget child){
    return Container(
      padding: AppStyles.pd4,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.textGreyColor,width: 0.5)
      ),
      child: child,
    );
  }
  
}
