import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';

class UtilHelper {
  static String getLocale(String locale) {
    if (locale.length > i_1) {
      return locale.substring(i_0, i_2);
    } else if (locale.length <= i_1) {
      return locale;
    } else {
      return "en";
    }
  }

  /// Function that uses image_picker to trigger the image picker flow
  /// There's an option to pass a callback action in params to handle
  /// the response.
  ///
  static Future<XFile?> pickImage({ImageSource source = ImageSource.camera}) {
    final ImagePicker _imagePicker = ImagePicker();
    return _imagePicker.pickImage(source: source);
  }

  // static Future<File> cropImage(String path) async {
  //   CroppedFile? croppedFile = await ImageCropper().cropImage(
  //       sourcePath: path,
  //       aspectRatio: CropAspectRatio(ratioX: 3, ratioY: 2),
  //       cropStyle: CropStyle.rectangle,
  //       compressQuality: 100);
  //   return File(croppedFile!.path);
  // }

  static String dateFormate(DateTime date) {
    String formattedDate = DateFormat('MM-dd-yyyy').format(date);
    print(formattedDate);
    return formattedDate;
  }
}
