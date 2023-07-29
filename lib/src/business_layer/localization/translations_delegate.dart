import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/business_layer/localization/translations.dart';

class TranslationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'no'].contains(locale.languageCode);

  /// Load the translations of a certain locale.
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;

  /// Norwegian
  static const Locale jaLocale = Locale('no');

  /// English
  static const Locale enLocale = Locale('en');

  /// List of supported languages
  static List<Locale> get supportedLocales => [jaLocale, enLocale];
}
