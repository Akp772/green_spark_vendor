import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class CommonCardWidget extends StatelessWidget {
  const CommonCardWidget({Key? key, required this.icon, required this.onIconTap}) : super(key: key);
  final Widget icon;
  final VoidCallback onIconTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          // navigatorKey.currentState!.push(ScreenNavigation.createRoute(widget:  SingleProductDetailScreen(result: _homeProvider!.productsListingResponseModel!.context!.results![index])));
        },
        child: _postAdsProductItemWidget()
    );
  }

  Widget _postAdsProductItemWidget(){
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.plannerBgColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                color: AppColors.textColor,
                offset: Offset(0.0, 0.75),
              ), //BoxShadow//BoxShadow
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: AppStyles.pd20 ,
                    child : AppImages.headphoneIcon,
                  ),
                ),
                _belowCardWidget()
              ],
            ),
          ),
        ),
        Positioned(
            right: 10,top: 10,
            child: InkWell(
                onTap: (){},
                child: AppImages.heartRedIcon)
        )
      ],
    );
  }

  Widget _belowCardWidget(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 14),
      color: AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppStyles.sbHeight6,
           Row(
             crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded( child: PoppinsSemiBoldText(text: "Apple mobile phone model -  13 pro max", fontSize: 12,color: AppColors.textColor,)),
              _ratingIcon()
            ],
          ),
          AppStyles.sbHeight4,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PoppinsSemiBoldText(text: "USD 299989", fontSize: 10,color: AppColors.blackTextColor,),
              AppStyles.sbWidth2,
              const CommonText(text: "USD 299989",fontSize: 10,color: AppColors.textColor,textDecoration: TextDecoration.lineThrough,)
            ],
          ),
        ],
      ),
    );
  }

  Widget _ratingIcon(){
    return SizedBox(
      height: 10,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppImages.startIcon,
          AppImages.startIcon,
          AppImages.startIcon,
          AppImages.startIcon,
          AppImages.halfStartIcon,
          const PoppinsMediumText(text: "(23)", fontSize: 8,color: AppColors.lightBlueSecondColor,)
        ],
      ),
    );
  }

}
