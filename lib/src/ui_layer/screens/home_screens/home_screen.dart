import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/device_info_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/bottom_nav_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
        elevation: 0,
        title: const PoppinsSemiBoldText(text: "Vendor Name",fontSize: 16,color: AppColors.whiteColor,),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none,color: AppColors.whiteColor,))
        ],
      ),
      backgroundColor: AppColors.lightGreyColor,
      body: _mainWidget(context),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _topProductDetailsWidget(),
              _storeListingWidget(),
              _moreSectionWidget(),
              _topSellingWidget()
            ],
          ),
        )
    );
  }

  Widget _topProductDetailsWidget(){
    return Container(
      color: AppColors.whiteColor,
      padding: AppStyles.pd20,
      child: Column(
        children: [
          Row(
            children: [
              _commonProductItemDetailWidget(AppImages.orderIcon,"Total Order"),
               AppStyles.sbWidth10,
              _commonProductItemDetailWidget(AppImages.saleIcon,"Today’s Sale"),
            ],
          ),
          AppStyles.sbHeight10,
          Row(
            children: [
              _commonProductItemDetailWidget(AppImages.catalogIcon,"Total Latest Order"),
              AppStyles.sbWidth10,
              _commonProductItemDetailWidget(AppImages.productIcon,"Yesterday’s Total"),
            ],
          )
        ],
      ),
    );
  }

  Widget _commonProductItemDetailWidget(Widget icon,String text){
    return Expanded(
      child: Container(
        padding: AppStyles.pd15,
        decoration: BoxDecoration(
          color: AppColors.appMainColor,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Row(
          children: [
              icon,
              AppStyles.sbWidth10,
              Expanded(child: PoppinsSemiBoldText(text: text, fontSize: 14,color: AppColors.whiteColor,))
          ],
        ),
      ),
    );
  }

  Widget _storeListingWidget(){
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4)
      ),
      padding: AppStyles.pdH20V8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppStyles.sbHeight5,
          const PoppinsSemiBoldText(text: "Store Reports", fontSize: 16,color: AppColors.textGreyColor,),
          AppStyles.sbHeight10,
          Container(
            padding: AppStyles.pd15,
            color: AppColors.whiteColor,
            child: GridView.builder(
                itemCount: 6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 15.0),
                itemBuilder: (context, index){
                  return _commonStoreItemWidget();
                }
             ),
          )
        ]
      ),
    );
  }

  Widget _moreSectionWidget(){
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4)
      ),
      padding: AppStyles.pdH20V8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppStyles.sbHeight5,
          const PoppinsSemiBoldText(text: "More Options", fontSize: 16,color: AppColors.textGreyColor,),
          AppStyles.sbHeight10,
          Container(
            padding: AppStyles.pd15,
            color: AppColors.whiteColor,
            child: GridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 15.0),
                itemBuilder: (context, index){
                  return _commonStoreItemWidget();
                }
             ),
          )
        ]
      ),
    );
  }

  Widget _topSellingWidget(){
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4)
      ),
      padding: AppStyles.pdH20V8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppStyles.sbHeight5,
          const PoppinsSemiBoldText(text: "Top Selling Items", fontSize: 16,color: AppColors.textGreyColor,),
          AppStyles.sbHeight10,
          Container(
            padding: AppStyles.pd15,
            color: AppColors.whiteColor,
            child: ListView.separated(
                itemCount: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return _topSellingItem();
                },
                separatorBuilder: (context, index){
                     return AppStyles.sbHeight8;
                }
             ),
          )
        ]
      ),
    );
  }

  Widget _topSellingItem(){
    return Row(
      children: [
        Container(
          height: 57,width: 56,
          decoration:  BoxDecoration(
              color: AppColors.productItemBgColor,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.textColor.withOpacity(0.4),width: 1)
          ),
          child: AppImages.productDemoImg,
        ),
        AppStyles.sbWidth10,
        const SubTitleText(text: "Lorem ipsum dolor sit amet",fontSize: 14,color: AppColors.textColor,)
      ],
    );
  }

  Widget _commonStoreItemWidget() {
    return Column(
      children: [
        _commonRoundedWidget(),
        AppStyles.sbHeight10,
        const PoppinsSemiBoldText(text: "Unfulfilled items", fontSize: 14,color: AppColors.textGreyColor,textAlign: TextAlign.center,),
      ],
    );
  }

  Widget _commonRoundedWidget(){
    return Container(
      height: 65,width: 65,
      padding: AppStyles.pd10,
      decoration: BoxDecoration(
        color: AppColors.appMainColor,
        borderRadius: BorderRadius.circular(50)
      ),
      child: AppImages.orderIcon,
    );
  }



}
