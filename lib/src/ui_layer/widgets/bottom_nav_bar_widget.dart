import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/screen_navigation_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/drawer_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bottomNavBarWidget();
  }

  Widget _bottomNavBarWidget(){
    return  BottomAppBar( //bottom navigation bar on scaffold
      color: AppColors.appMainColor,
      shape: const CircularNotchedRectangle(), //shape of notch
      notchMargin: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 10,top: 20),
        child: Row( //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _navBarItemWidget(const Icon(Icons.home_outlined,color: AppColors.whiteColor,),"Home",i_0),
            _navBarItemWidget(const Icon(Icons.shopping_bag_outlined,color: AppColors.whiteColor,),"Chat",i_1),
            _navBarItemWidget(const Icon(Icons.favorite_border,color: AppColors.whiteColor,),"My Ads",i_2),
            _navBarItemWidget(const Icon(Icons.menu,color: AppColors.whiteColor,),"Menu",i_3),
          ],
        ),
      ),
    );
  }


  Widget _navBarItemWidget(Widget icon, String label, int type){
    return InkWell(
      onTap: () async {
        if(type == i_3){
          navigatorKey.currentState!.push(ScreenNavigation.createRoute(widget: const DrawerWidget()));
        }
        else if(type == i_0){
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          // PoppinsMediumText(text: label, fontSize: 12,height: 1.5,)
        ],
      ),
    );
  }
}
