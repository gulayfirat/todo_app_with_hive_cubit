import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  LanguageManager._init();
  final String languagePath = 'assets/lang';

 
  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
