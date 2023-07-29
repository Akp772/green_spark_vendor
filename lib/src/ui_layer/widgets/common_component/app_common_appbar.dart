import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

///CommonAppBar with having
///Default scaffold bg color :- white
///Default backButton Color :- black
///Default fontColor :- black
class CommonAppBar extends StatelessWidget {
  const CommonAppBar(
      {Key? key,
      this.backgroundColor = AppColors.whiteColor,
      this.isBlackArrow = true,
      this.titleText,
      this.fontColor = AppColors.whiteColor,
      this.elevation = d_0,
      this.isProfileScreen = false,
      this.onTapOfMoreButton,
      this.actionButton,
      this.leadingWidget})
      : super(key: key);
  final Color backgroundColor;
  final bool isBlackArrow;
  final String? titleText;
  final Color fontColor;
  final bool isProfileScreen;
  final Function? onTapOfMoreButton;
  final Widget? actionButton;
  final double elevation;
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CommonColor.instance.backgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: leadingWidget ??
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: AppImages.backIcon,
          ),
      title: CommonText(
        text: titleText ?? '',
        fontSize: 24,
      ),
    );
  }
}
