import 'package:fluttertoast/fluttertoast.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';

class FlutterToastHelper {
  static void showToast(String msg) {
    if (msg.isNotEmpty) {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG,
          fontSize: 14,
          backgroundColor: AppColors.buttonBlackShadeColor,
          msg: msg);
    }
  }
}
