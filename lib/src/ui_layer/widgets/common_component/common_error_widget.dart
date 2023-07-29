import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class CommonErrorWidget extends StatelessWidget {
  const CommonErrorWidget({Key? key, required this.errorText}) : super(key: key);
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          AppStyles.sbHeight2,
          SubTitleText(text: errorText,color: Colors.red,textAlign: TextAlign.left,),
        ],
      ),
    );
  }

}