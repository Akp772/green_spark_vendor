// import 'package:flutter/material.dart';
// import 'package:green_spark_vendor/src/business_layer/util/helper/device_info_helper.dart';
// import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
// import 'package:green_spark_vendor/src/data_layer/res/images.dart';
// import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
// import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
// import 'package:green_spark_vendor/src/ui_layer/widgets/bottom_nav_bar_widget.dart';
// import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_app_bar_widget.dart';
// import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
//
// class OrderDetailScreen extends StatefulWidget {
//   const OrderDetailScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OrderDetailScreen> createState() => _OrderDetailScreenState();
// }
//
// class _OrderDetailScreenState extends State<OrderDetailScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.lightGreyColor,
//       body: _mainWidget(),
//       bottomNavigationBar: const BottomNavBarWidget(),
//     );
//   }
//
//   Widget _mainWidget() {
//     return  SafeArea(
//         child: Column(
//         children: [
//            const CommonAppBarWidget(title: "View Details",),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   _richTextWidget(),
//                   _orderRequestWidget(),
//                   AppStyles.sbHeight5,
//                   _paymentAndOrderDetails(),
//                   AppStyles.sbHeight5,
//                   Container(
//                     color: AppColors.whiteColor,
//                     padding: AppStyles.pdH15V11,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         _commonButton(const PoppinsMediumText(text: "Update Status",fontSize: 14,color: AppColors.whiteColor,height: onePointFive,),AppColors.textColor.withOpacity(0.5),Colors.transparent),
//                         AppStyles.sbWidth10,
//                         _commonButton(const PoppinsMediumText(text: "Fulfill Order",fontSize: 14,color: AppColors.whiteColor,height: onePointFive,),AppColors.appMainColor,AppColors.appMainColor)
//                       ],
//                     ),
//                   ),
//                   AppStyles.sbHeight5,
//                   _shippingWidget(),
//                   AppStyles.sbHeight5,
//                   _customerDetailsWidget(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//     ));
//   }
//
//   Widget _shippingWidget(){
//     return Container(
//       color: AppColors.whiteColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: AppStyles.pdH20V12,
//             child: _commonHeadingWidgetWithIcon(AppImages.vehicleIcon, "Shipping Notes"),
//           ),
//           _dividerWidget(AppColors.textColor, 0.4),
//           const Padding(
//             padding: AppStyles.pdH20V12,
//             child: CommonText(text: "No courier agency assigned yet",fontSize: 14,color: AppColors.textGreyColor,),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _customerDetailsWidget(){
//     return Container(
//       color: AppColors.whiteColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: AppStyles.pdH20V12,
//             child: _commonHeadingWidgetWithIcon(AppImages.customerIcon, "Customer details"),
//           ),
//           _dividerWidget(AppColors.textColor, 0.4),
//           const Padding(
//             padding: AppStyles.pdH20V12,
//             child: Column(
//               children: [
//                 PoppinsMediumText(text: "James Charles", fontSize: 16,color: AppColors.textGreyColor,)
//               ],
//             ),
//           ),
//           Padding(
//             padding: AppStyles.pdH20V12,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(child: _commonButton(const PoppinsMediumText(text: "Send Message",fontSize: 14,color: AppColors.whiteColor,height: onePointFive,textAlign: TextAlign.center,),Colors.black,Colors.transparent)),
//                 AppStyles.sbWidth10,
//                 Expanded(child: _commonButton(const PoppinsMediumText(text: "Invoice",fontSize: 14,color: AppColors.whiteColor,height: onePointFive,textAlign: TextAlign.center,),AppColors.textColor.withOpacity(0.5),Colors.transparent)),
//                 AppStyles.sbWidth10,
//                 Expanded(child: _commonButton(const PoppinsMediumText(text: "View Dispute",fontSize: 14,color: AppColors.whiteColor,height: onePointFive,textAlign: TextAlign.center,),AppColors.appMainColor,AppColors.appMainColor))
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _paymentAndOrderDetails(){
//     return Container(
//       color: AppColors.whiteColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: AppStyles.pdH20V12,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _commonHeadingWidgetWithIcon(AppImages.paymentsIcons,"Payment : Bank Wire Transfer"),
//                 _commonButton(const SubTitleText(text: "Pending",fontSize: 14,color: AppColors.whiteColor,),AppColors.lightBlueThirdColor,AppColors.lightBlueThirdColor),
//               ],
//             ),
//           ),
//           _dividerWidget(AppColors.blackTextColor.withOpacity(0.5),1),
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                  const Padding(
//                    padding: AppStyles.pdH20V12,
//                    child: PoppinsSemiBoldText(text: "Order Details", fontSize: 16,color: AppColors.textGreyColor,),
//                  ),
//                  _dividerWidget(AppColors.textColor, 0.4),
//                  ListView.separated(
//                      shrinkWrap: true,
//                      itemBuilder: (context,index) =>  Padding(
//                        padding: AppStyles.pdH20V12,
//                        child: _orderItemWidget(),
//                      ),
//                      separatorBuilder: (context,index) => _dividerWidget(AppColors.textColor, 0.4),
//                      itemCount: 2),
//                _dividerWidget(AppColors.textColor, 0.4),
//                AppStyles.sbHeight10,
//                _priceDetailsWidget("Total","\$ 82.00"),
//                AppStyles.sbHeight10,
//                _priceDetailsWidget("Discount","\$ 82.00"),
//                AppStyles.sbHeight10,
//                _priceDetailsWidget("Shipping","\$ 82.00"),
//                AppStyles.sbHeight10,
//                _priceDetailsWidget("Packaging","\$ 82.00"),
//                AppStyles.sbHeight10,
//                _priceDetailsWidget("Handling","\$ 82.00"),
//                AppStyles.sbHeight10,
//                _priceDetailsWidget("Taxes","\$ 82.00"),
//                AppStyles.sbHeight10,
//                _grandTotalWidget("Grand Total", "\$ 82.00"),
//                AppStyles.sbHeight20,
//              ],
//            ),
//
//         ],
//       ),
//     );
//   }
//
//   Widget _commonHeadingWidgetWithIcon(Widget icon,String text){
//     return Row(
//       children: [
//         icon,
//         AppStyles.sbWidth10,
//         PoppinsMediumText(text: text, fontSize: 14,color: AppColors.textGreyColor,),
//         AppStyles.sbWidth10,
//       ],
//     );
//   }
//
//   Widget _priceDetailsWidget(String label, String text){
//     return Row(
//       children: [
//          Expanded(
//              flex: 3,
//              child: Align(
//                  alignment: Alignment.centerRight,
//                  child: CommonText(text: label,fontSize: 14,color: AppColors.textGreyColor,))),
//          AppStyles.sbWidth20,
//          Expanded(
//              flex: 1,
//              child: Align(
//                  alignment: Alignment.centerRight,
//                  child: CommonText(text: text,fontSize: 14,color: AppColors.textGreyColor,))),
//
//       ],
//     );
//   }
//
//   Widget _grandTotalWidget(String label, String text){
//     return Row(
//       children: [
//         Expanded(
//             flex: 3,
//             child: Align(
//                 alignment: Alignment.centerRight,
//                 child: PoppinsMediumText(text: label,fontSize: 16,color: AppColors.textGreyColor,))),
//         AppStyles.sbWidth20,
//         Expanded(
//             flex: 1,
//             child: Align(
//                 alignment: Alignment.centerRight,child: PoppinsMediumText(text: text,fontSize: 16,color: AppColors.textGreyColor,))),
//
//       ],
//     );
//   }
//
//   Widget _orderItemWidget(){
//     return Row(
//       children: [
//         Container(
//           height: 50,width: 50,
//           decoration: BoxDecoration(
//             border: Border.all(color: AppColors.textColor,width: 0.5)
//           ),
//           child: AppImages.productDemoImg,
//         ),
//         AppStyles.sbWidth10,
//         const Expanded(child: CommonText(text: "nam: Veniam facere deleniti est quo nesciunt ndskkm vb",fontSize: 14,color: AppColors.textGreyColor,)),
//         AppStyles.sbWidth10,
//         const CommonText(text: "41 X 1",fontSize: 14,color: AppColors.textGreyColor,),
//         AppStyles.sbWidth10,
//         const CommonText(text: "\$ 41 ",fontSize: 14,color: AppColors.textGreyColor,),
//       ],
//     );
//   }
//
//   Widget _richTextWidget(){
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: RichText(
//           text: const TextSpan(
//               style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.textGreyColor),
//               children:[
//                 TextSpan(text:'Order No. '),
//                 TextSpan(text:'#383938',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.textGreyColor)),
//               ]
//           )
//       ),
//     );
//   }
//
//   Widget _commonRichTextWidget(String label,String text){
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2.0),
//       child: RichText(
//           text:  TextSpan(
//               style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.textColor),
//               children:[
//                 TextSpan(text:label),
//                 TextSpan(text:text,style: const TextStyle(fontWeight: FontWeight.w300,color: AppColors.textColor)),
//               ]
//           )
//       ),
//     );
//   }
//
//   Widget _orderRequestWidget(){
//     return Container(
//       color: AppColors.whiteColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: AppStyles.pdH20V12,
//             child: _commonHeadingWidgetWithIcon(AppImages.cancelIcon, "Cancellation Request"),
//           ),
//           _dividerWidget(AppColors.blackTextColor.withOpacity(0.5),1),
//           Padding(
//             padding: AppStyles.pdH20V12,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _commonRichTextWidget("Reason: ","Order created by mistake"),
//                 _commonRichTextWidget("Detail: ","I beg apology for this"),
//                 _commonRichTextWidget("Requested Items: ","All items"),
//                 AppStyles.sbHeight10,
//                 _buttonsWidget()
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
//
//   Widget _buttonsWidget(){
//     return  Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         _commonButton(const SubTitleText(text: "Approve",fontSize: 14,color: AppColors.whiteColor,),AppColors.lightBlueThirdColor,AppColors.lightBlueThirdColor),
//         AppStyles.sbWidth10,
//         _commonButton(const SubTitleText(text: "Decline",fontSize: 14,color: AppColors.whiteColor,),AppColors.redishColor,AppColors.redishColor)
//       ],
//     );
//   }
//
//   Widget _commonButton(Widget widget,Color color,Color borderColor){
//     return Container(
//       height: 30,
//       padding: AppStyles.pdH8,
//       // alignment: Alignment.center,
//       decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(3),
//           border: Border.all(color: borderColor,width: 1)
//       ),
//       child: widget,
//     );
//   }
//
//
//   Widget _dividerWidget(Color color,double height){
//     return Container(
//       height: height,
//       width: DeviceInfo.width,
//       decoration: BoxDecoration(
//         color: color,
//       ),
//     );
//   }
//
// }
