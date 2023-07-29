import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/device_info_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/bottom_nav_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appMainColor,
      body: _mainWidget(),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }

  Widget _mainWidget() {
    return  SafeArea(
        child: Container(
          color: AppColors.whiteColor,
          child: Column(
            children: [
              // const ProfileAppBarWidget(isNotification:true),
              AppStyles.sbHeight20,
              const PoppinsMediumText(text: "Notifications", fontSize: 18,color: AppColors.blackTextColor,),
              AppStyles.sbHeight20,
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context,index) => _notificationItemWidget(),
                    separatorBuilder: (context,index) => _divider(),
                    itemCount: 10
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _divider(){
    return Container(
      height: 0.5,
      width: DeviceInfo.width,
      color: AppColors.textColor,
    );
  }

  Widget _notificationItemWidget(){
    return Container(
      padding: AppStyles.pd20,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubTitleText(text: "Lorem Ipsum",color: AppColors.textColor,fontSize: 16,),
              SubTitleText(text: "2 days ago",color: AppColors.textColor,fontSize: 14,),
            ],
          ),
          AppStyles.sbHeight15,
          const CommonText(text: "Lorem ipsum dolor sit amet consectetur. A nul morbi et risus praesent in aliquet sit. Tellus sit varius sit ut purus eu nisi njgrgto lorem idjfoi",fontSize: 14,color: AppColors.textColor,)
        ],
      ),
    );
  }
}
