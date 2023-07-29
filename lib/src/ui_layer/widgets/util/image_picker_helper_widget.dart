import 'dart:io';

import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/business_layer/localization/translations.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/util/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';

class PickImageActionSheet extends StatelessWidget {
  const PickImageActionSheet({
    Key? key,
    required this.pickFile,
    required this.title,
    this.isProfile = true,
  }) : super(key: key);
  final Function(File) pickFile;
  final String title;
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: PoppinsBoldText(
        text: title,
        textAlign: TextAlign.center,
        fontSize: d_15,
        color: AppColors.textColor,
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: const PoppinsMediumText(
            text: "Choose From Gallery",
            textAlign: TextAlign.center,
            fontSize: 15,
            color: AppColors.appMainColor,
          ),
          onPressed: () async {
            _getImage(context, fromCamera: false);
          },
        ),
        CupertinoActionSheetAction(
          child: const PoppinsMediumText(
            text: "Take Photo From Camera",
            textAlign: TextAlign.center,
            fontSize: 15,
            color: AppColors.appMainColor,
          ),
          onPressed: () async {
            _getImage(context, fromCamera: true);
            // _getImage(context, fromCamera: true);
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          navigatorKey.currentState!.pop();
          // Navigator.of(context).pop;
        },
        child: const PoppinsBoldText(
          text: "Cancel",
          textAlign: TextAlign.center,
          fontSize: 15,
          color: AppColors.blueColor,
        ),
      ),
    );
  }

  /// Method used to pick image from camera
  void _getImage(BuildContext context, {bool fromCamera = false}) async {
    Navigator.pop(context);
    XFile? image =
    await ImagePickerHelper.pickProfileImage(fromCamera: fromCamera);
    if (image != null && isProfile) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        cropStyle: CropStyle.circle,
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            showCropGrid: true,
          ),
        ],
      );
      File file = File(croppedFile!.path);
      pickFile(file);
    } else if (image != null) {
      File file = File(image.path);
      pickFile(file);
    }
  }

/*
  /// function to display language change option bottom sheet for android
  Widget showAndroidLanguagePicker(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppStyles.sbHeight20,
          PoppinsBoldText(
            text: title,
            textAlign: TextAlign.center,
            fontSize: d_15,
            color: AppColors.textColor,
          ),
          AppStyles.sbHeight20,
          Container(
              width: double.infinity,
              height: 1,
              color: AppColors.textColor),
          ListTile(
              title: const Text("Choose From Gallery"),
              onTap: () {
                _getImage(context, fromCamera: false);
              }),
          Container(
              width: double.infinity,
              height: 1,
              color: AppColors.mainColor),
          ListTile(
            title: const Text("Take Photo From Camera"),
            onTap: () {
              _getImage(context, fromCamera: true);
            },
          ),
          Container(
              width: double.infinity,
              height: 1,
              color: AppColors.mainColor),
          ListTile(
              title: const Center(
                  child: Text("Cancel")),
              onTap: () => {Navigator.pop(context)}),
          AppStyles.sbHeight10,
        ],
      ),
    );
  }*/

}
