import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_theme.dart';
import 'i_light_theme.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  AppThemeLight._init();
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  @override
  ThemeData get theme => ThemeData(
      colorScheme: _appColorScheme,
      textTheme: textTheme(),
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: textThemeLight.headline6,
          systemOverlayStyle: SystemUiOverlayStyle.dark),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.transparent, elevation: 0));
  TextTheme textTheme() {
    return ThemeData.light().textTheme.copyWith(
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
    return ColorScheme(
      primary: colorSchemeLight.primaryColor,
      secondary: colorSchemeLight.primaryColor,
      surface: Colors.white,
      background: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.grey,
      onBackground: Colors.white,
      onError: Colors.white,
      brightness: Brightness.light,
    );
  }
}
