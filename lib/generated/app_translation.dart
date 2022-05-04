import 'dart:ui';

import 'package:get/get.dart';

class AppTranslation extends Translations {
  static var fallbackLocale = const Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'pl': Locales.pl,
        'vi': Locales.vi_VN,
        'en': Locales.en,
      };
}

class LocaleKeys {
  LocaleKeys._();

  static const ask_existing_page = 'ask_existing_page';
}

class Locales {
  static const en = {
    'ask_existing_page': 'EnglishEnglishEnglishEnglishEnglish',
  };
  static const vi_VN = {
    'ask_existing_page': 'Việt Nam',
  };
  static const pl = {
    'ask_existing_page': 'Balan',
  };
}
