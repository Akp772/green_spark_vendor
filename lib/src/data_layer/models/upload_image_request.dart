import 'dart:io';

import 'package:dio/dio.dart';

class UpdateImageRequestModel {
  UpdateImageRequestModel({this.image});

  File? image;

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      if (image != null)
        'image': await MultipartFile.fromFile(image!.path,
            filename: 'image${DateTime.now().microsecondsSinceEpoch}.png'),
    });
  }
}
