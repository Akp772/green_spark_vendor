import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';

class AppBottomSheets {
  static Future commonAppBottomSheet(BuildContext context, Widget childWidget,
      {Color? barrierColor}) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor:Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(d_20),
                topRight: Radius.circular(d_20))),
        context: context,
        builder: (_) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppStyles.sbHeight20,
                    Container(
                      width: 134,
                      height: 5,
                      decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    childWidget
                  ],
                ),
              ),
            ));
  }
}
