import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/providers/base_provider.dart';
import 'package:green_spark_vendor/src/business_layer/providers/catalogue_provider.dart';
import 'package:green_spark_vendor/src/business_layer/providers/home_provider.dart';
import 'package:green_spark_vendor/src/business_layer/providers/profile_provider.dart';
import 'package:green_spark_vendor/src/business_layer/providers/registration_provider.dart';
import 'package:green_spark_vendor/src/business_layer/providers/stocks_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


class RegisterProviders {
  //Register all providers used in the application here
  static List<SingleChildWidget> providers(BuildContext context) => [
        ChangeNotifierProvider<BaseProvider>(
          create: (context) => BaseProvider(),
        ),ChangeNotifierProvider<RegistrationProvider>(
          create: (context) => RegistrationProvider(),
        ),ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(),
        ),ChangeNotifierProvider<CatalogueProvider>(
          create: (context) => CatalogueProvider(),
        ),ChangeNotifierProvider<StocksProvider>(
          create: (context) => StocksProvider(),
        ),
      ];
}
