import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_theme.dart';
import 'i_dark_theme.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  AppThemeDark._init();
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  @override
  ThemeData get theme => ThemeData(
      colorScheme: _appColorScheme,
      textTheme: textTheme(),
      appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: textThemeLight.headline6,
          systemOverlayStyle: SystemUiOverlayStyle.light),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.transparent, elevation: 0));
  TextTheme textTheme() {
    return ThemeData.dark().textTheme.copyWith(
          displayLarge: textThemeLight.headline1,
          displayMedium: textThemeLight.headline2,
          displaySmall: textThemeLight.headline3,
          headlineMedium: textThemeLight.headline4,
          headlineSmall: textThemeLight.headline5,
          titleLarge: textThemeLight.headline6,
          labelLarge: textThemeLight.button,
          labelMedium: textThemeLight.caption,
          labelSmall: textThemeLight.overline,
          bodyLarge: textThemeLight.bodyText1,
          bodyMedium: textThemeLight.bodyText2,
          titleMedium: textThemeLight.subtitle1,
          titleSmall: textThemeLight.subtitle2,
        );
  }

  ColorScheme get _appColorScheme {
    return  ColorScheme(
        primary: colorSchemeDark.primaryColor,
        secondary:colorSchemeDark.primaryColor,
        surface: Colors.black,
        background: Colors.white,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.grey,
        onBackground: Colors.white,
        onError: colorSchemeDark.primaryColor,
        brightness: Brightness.dark);
  }
}
