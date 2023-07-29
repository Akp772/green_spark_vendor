import 'dart:async';

import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/app.dart';
import 'package:green_spark_vendor/src/data_layer/local_db/hive_database_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'src/business_layer/util/helper/flavor_configuration_helper.dart';

Future<void> main() async {
  /// This method call binds the framework to the Flutter engine
  WidgetsFlutterBinding.ensureInitialized();

  /// Sets the status bar color of the widget
  AppStyles.setStatusBarTheme();
  

  /// Sets the device orientation of application
  AppStyles.setDeviceOrientationOfApp();

  /// Used to initialize hive db and register adapters
  await HiveHelper.initializeHiveAndRegisterAdapters();

  /// Used to get initialize hive db and register adapters and generate
  /// a secure key to encrypt hive box
  /// Do not remove below lines
  // await SecureStorageHelper.instance.generateEncryptionKey();
  //Sets the server config of application

  FlavorConfig.setServerConfig();

  /// Used to runs the application on Dev or QA server
  runApp(
    const GreenSparkVendorApp(),
  );

}
