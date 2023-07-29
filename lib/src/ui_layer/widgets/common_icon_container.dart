import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';

class CommonIconContainer extends StatelessWidget {
  const CommonIconContainer(
      {Key? key,
      required this.icon,
      this.height = 44,
      this.width = 44,
      this.scale = 1.5})
      : super(key: key);
  final Widget icon;
  final double height;
  final double width;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: CircleAvatar(
        child: Container(
          height: AppStyles.getHeight(height),
          width: AppStyles.getWidth(width),
          decoration: AppStyles.radiusBoxDecoration(
              radius: 48, color: AppColors.blackTextColor),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: icon,
          ),
        ),
      ),
    );
  }
}
