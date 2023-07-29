import 'dart:io';

import 'package:green_spark_vendor/src/business_layer/util/helper/log_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/flutter_toast_helper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {

  static pickProfileImage({bool fromCamera = false}) async {
    final ImagePicker picker = ImagePicker();
    XFile? image;
    image = await picker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
        maxHeight: 720,
        maxWidth: 720,);
    if (image != null) {
      LogHelper.logData("Picked image=>$image");
      return image;
    } else {
      return null;
    }
  }


  bool checkFileSize(path) {
    var fileSizeLimit = 1024*5;
    File f = File(path);
    var s = f.lengthSync();
    var fileSizeInKB = s / 1024;
    // Convert the KB to MegaBytes (1 MB = 1024 KBytes)
    var fileSizeInMB = fileSizeInKB / 1024;
    if(fileSizeInKB >= fileSizeLimit) {
      return false;
    } else {
      return true;
    }
  }
}
