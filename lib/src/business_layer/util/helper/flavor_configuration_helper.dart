import 'package:flutter/material.dart';
import 'package:green_spark_vendor/app_settings.dart';
import 'package:green_spark_vendor/src/business_layer/network/api_constants.dart';

enum Flavor { dev, qa, production }

class FlavorValues {
  FlavorValues({
    required this.baseUrl,
    required this.apiKey,
  });

  final String baseUrl;
  final String apiKey;
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static late FlavorConfig _instance;

  factory FlavorConfig({
    required Flavor flavor,
    Color color = Colors.blue,
    required FlavorValues values,
  }) {
    _instance = FlavorConfig._internal(
        flavor, enumName(flavor.toString()), color, values);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.production;

  static bool isDevelopment() => _instance.flavor == Flavor.dev;

  static bool isQA() => _instance.flavor == Flavor.qa;

  static String enumName(String enumToString) {
    List<String> paths = enumToString.split(".");
    return paths[paths.length - 1];
  }

  static void setServerConfig() {
    if (AppSettings.isProduction) {
      FlavorConfig(
        flavor: Flavor.production,
        values: FlavorValues(
          baseUrl: ApiConstant.urlProdServer,
          apiKey: ApiConstant.prodApiKey,
        ),
      );
    } else if (AppSettings.isQA) {
      FlavorConfig(
        flavor: Flavor.qa,
        values: FlavorValues(
          baseUrl: ApiConstant.urlTestServer,
          apiKey: ApiConstant.testApiKey,
        ),
      );
    } else {
      FlavorConfig(
        flavor: Flavor.dev,
        values: FlavorValues(
          baseUrl: ApiConstant.urlDevServer,
          apiKey: ApiConstant.devApiKey,
        ),
      );
    }
  }
}
