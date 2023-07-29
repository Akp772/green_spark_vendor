import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class CommonCard extends StatelessWidget {
  const CommonCard(
      {Key? key,
      this.thirdElement,
      this.isThirdWidget = true,
      required this.firstElement,
      required this.secondElement})
      : super(key: key);

  final Widget? thirdElement;
  final Widget firstElement;
  final String secondElement;
  final bool isThirdWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.radiusBoxDecoration(
        radius: 8,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackTextColor,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: Padding(
        padding: AppStyles.pdH19V11,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                /// mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  firstElement,
                  AppStyles.sbWidth15,
                  Flexible(child: _commonUsedSubtitleText(secondElement)),
                ],
              ),
            ),
            if (isThirdWidget)
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(child: thirdElement!),
                  ],
                ),
              ),
            // if (!isThirdWidget)Expanded(child: Container(color: Colors.red,width: 10,height: 10,)),
          ],
        ),
      ),
    );
  }

  ///
  Widget _commonUsedSubtitleText(String text) {
    return SubTitleText(
      text: text,
      color: AppColors.blackTextColor,
      height: 1.5,
      fontSize: d_16,
    );
  }
}
