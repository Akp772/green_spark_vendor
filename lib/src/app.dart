import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/device_info_helper.dart';
import 'package:green_spark_vendor/src/business_layer/util/helper/log_helper.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/provider_registration.dart';
import 'package:green_spark_vendor/src/ui_layer/screens/splash_screen/splash_screen.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'business_layer/localization/translations.dart';
import 'business_layer/localization/translations_delegate.dart';


///
final navigatorKey = GlobalKey<NavigatorState>();


class GreenSparkVendorApp extends StatefulWidget {
  const GreenSparkVendorApp({Key? key}) : super(key: key);

  @override
  State<GreenSparkVendorApp> createState() => _GreenSparkVendorAppState();
}

class _GreenSparkVendorAppState extends State<GreenSparkVendorApp>
    with WidgetsBindingObserver {
  final String _tag = "MyApp:";
  String _locale = "en";
  String id = "";
  String fcmToken = "";
  String name = "";
  String profileImage = "";

  ///AgoraProvider? agoraProvider;

  @override
  void initState() {
    super.initState();

    /// Add observer to listen app lifecycle and locale changes
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    /// Remove observer before widget dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeLocales(List<Locale>? locale) {
    super.didChangeLocales(locale);

    /// Change the locale when device locale is changed from settings in android
    /// For iOS app is automatically restarted
    if (Platform.isAndroid) {
      LogHelper.logData("$_tag Locale changed ===> $locale");
      setState(() {
        _locale = locale!.first.languageCode;
      });
    }
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    LogHelper.logData("$_tag AppLifecycleState ===> $state");
    // String userId = CommonHelperClass.instance.getUserId();
    // CommonHelperClass.instance.showToast = true;
    // CommonHelperClass.instance.sessionExpired = false;
    switch (state) {
      case AppLifecycleState.paused:

        /// Do something when app goes in background state
        break;
      case AppLifecycleState.resumed:

        /// Do something when app opens from background state
        break;
      case AppLifecycleState.inactive:

        /// Do something when app goes in minimized state
        break;
      case AppLifecycleState.detached:

        /// Do something when app goes in killed state
        break;
      default:

        /// Do nothing
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    AppStyles.setStatusBarTheme();
    return _foodStepsMaterialApp(context);
  }

  /// Main rental material app  widget first landed on [SplashScreen]
  Widget _foodStepsMaterialApp(BuildContext context) {
    return MultiProvider(
      providers: RegisterProviders.providers(context),
      child: MaterialApp(
          builder: (BuildContext context, Widget? child) {
            DeviceInfo.setDeviceInfo(context);
            return MediaQuery(
              data:
              MediaQuery.of(context).copyWith(textScaleFactor: d_1),
              child: child!,
            );
          },
          navigatorKey: navigatorKey,
          theme: AppStyles.getAppTheme(),
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (BuildContext context) =>
          AppLocalizations.current.getTitle,

          /// These delegates are responsible for loading the translations of the selected locale
          localizationsDelegates: const [
            TranslationsDelegate(),

            /// Built-in delegate for the localisation of the Material widgets
            GlobalMaterialLocalizations.delegate,

            /// Built-in localisation for text direction (left-to-right or right-to-left).
            GlobalWidgetsLocalizations.delegate,

            /// Built-in delegate for the localisation of the Cupertino widgets
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Locale(_locale),
          supportedLocales: TranslationsDelegate.supportedLocales,
          home: const SplashScreen()),
    );
  }

}
