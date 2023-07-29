import 'dart:developer' as developer;

import 'package:logger/logger.dart';
import 'package:green_spark_vendor/app_settings.dart';

class LogHelper {
  static void logData(var message, {String logName = ""}) {
    if (!AppSettings.isProduction) {
      Logger().d(message);
      developer.log(message.toString(), name: logName);
    }
  }

  static void logError(var message, {String logName = ""}) {
    if (!AppSettings.isProduction) {
      Logger().e(message);
      developer.log(message.toString(), name: logName);
    }
  }
}
