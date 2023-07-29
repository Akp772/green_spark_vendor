import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';

///@return the default scaffold with
///default bgColor :- white
class BaseWidget extends StatelessWidget {
  BaseWidget(
      {Key? key,
      required this.appBar,
      required this.bodyWidget,
      this.backgroundColor = AppColors.onBoardingBgColor,
      this.bottomNavWidget,
      this.bottomBgColor,
      this.bottomPd = AppStyles.pd20,
      this.preferredSizeAppBar = 70})
      : super(key: key);
  final Widget appBar;
  final double preferredSizeAppBar;
  final Widget bodyWidget;
  final Color backgroundColor;
  final Widget? bottomNavWidget;
  final Color? bottomBgColor;
  final EdgeInsets bottomPd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar:
          bottomNavWidget ?? const SizedBox.shrink(),
      backgroundColor: CommonColor.instance.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(preferredSizeAppBar),
        child: appBar,
      ),
      body: SafeArea(child: bodyWidget),
    );
  }
}
