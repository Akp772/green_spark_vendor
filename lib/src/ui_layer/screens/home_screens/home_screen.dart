import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/device_info_helper.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/cancellation_screens/cancellation_list_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/cart_screen/added_to_cart_list_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/coupons_screen/coupons_list_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/customer_screens/customer_list_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/orders_screen/order_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/reviews_screens/reviews_list_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/settings_screen/setting_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/shipping_screens/shipping_list_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/stocks_screen/total_stock_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/wishlist_screen/wishlist_screen.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/bottom_nav_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

import '../catalogue_screens/catalogue_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> optionsList = ['Catalogue', 'Orders','Stocks','Support','Reports',
    'Settings','Added to cart','Added to wishlist','Coupons','Shipping','Cancellation',
    'Customers','Messages ','Disputes','Reviews'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appMainColor,
        elevation: 0,
        leading: const SizedBox(),
        title: const PoppinsSemiBoldText(text: "Vendor Name",fontSize: 16,color: AppColors.whiteColor,),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none,color: AppColors.whiteColor,))
        ],
      ),
      backgroundColor: AppColors.lightGreyColor,
      body: _mainWidget(context),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _topProductDetailsWidget(),
              // _storeListingWidget(),
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
                itemCount: optionsList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 3,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 15.0),
                itemBuilder: (context, index){
                  return _commonStoreItemWidget(index);
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
          const PoppinsSemiBoldText(text: "Options", fontSize: 16,color: AppColors.textGreyColor,),
          AppStyles.sbHeight10,
          Container(
            padding: AppStyles.pd15,
            color: AppColors.whiteColor,
            child: GridView.builder(
                itemCount: optionsList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9,
                    crossAxisCount: 3,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 15.0),
                itemBuilder: (context, index){
                  return InkWell(
                      onTap: (){
                        _navigate(index);
                      },
                      child: _commonStoreItemWidget(index));
                }
             ),
          )
        ]
      ),
    );
  }

  void _navigate(int index){
    if(index == 0){
     Navigator.push(context, ScreenNavigation.createRoute(widget: const CatalogueScreen()));
    }else if(index == 1){
      Navigator.push(context, ScreenNavigation.createRoute(widget: const OrderScreen()));
    }else if(index == 2){
      Navigator.push(context, ScreenNavigation.createRoute(widget: const TotalStockScreen()));
    }else if(index == 5){
      Navigator.push(context, ScreenNavigation.createRoute(widget: const SettingScreen()));
    }else if(index == 6){
      Navigator.push(context, ScreenNavigation.createRoute(widget: const AddedToCartListScreen()));
    }else if(index == 7){
      Navigator.push(context, ScreenNavigation.createRoute(widget: const AddedToWishListScreen()));
    }else if(index == 8){
      Navigator.push(context, ScreenNavigation.createRoute(widget: const CouponsListScreen()));
    }else if(index == 9){
      Navigator.push(context, ScreenNavigation.createRoute(widget: const ShippingListScreen()));
    }else if(index == 10){
      Navigator.push(context, ScreenNavigation.createRoute(widget: const CancellationScreen()));
    }else if(index == 11){
      Navigator.push(context, ScreenNavigation.createRoute(widget: const CustomerListScreen()));
    }else if(index == 14){
      Navigator.push(context, ScreenNavigation.createRoute(widget: const ReviewsListScreen()));
    }
  }


  List<Widget> _iconsList(){
    return [AppImages.catalogIcon,AppImages.orderIcon,AppImages.stocks,
      AppImages.supportIcon,AppImages.report,AppImages.settingIcon,
      AppImages.catalogIcon,AppImages.catalogIcon,AppImages.coupons,
      AppImages.shipping,AppImages.cancelationIcon,AppImages.groupUserIcon,
    AppImages.message,AppImages.disputeIcon,AppImages.reviews,];
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

  Widget _commonStoreItemWidget(int index) {
    return Column(
      children: [
        _commonRoundedWidget(index),
        AppStyles.sbHeight10,
        PoppinsSemiBoldText(text: optionsList[index], fontSize: 14,color: AppColors.textGreyColor,textAlign: TextAlign.center,),
      ],
    );
  }

  Widget _commonRoundedWidget(int index){
    return Container(
      height: 65,width: 65,
      padding: AppStyles.pd10,
      decoration: BoxDecoration(
        color: AppColors.appMainColor,
        borderRadius: BorderRadius.circular(50)
      ),
      child: _iconsList()[index],
    );
  }



}
