import 'package:flutter/material.dart';

import '../../../product/constant/hive_constant.dart';
import '../../base/base_cache_manager.dart';
import '../../enum/theme/app_themes.dart';
import '../theme/darkTheme/theme_dark.dart';
import '../theme/lightTheme/theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  late final BaseCacheManager<AppThemes> manager;
  ThemeData currentTheme = AppThemeLight.instance.theme;
  AppThemes currentThemeEnum = AppThemes.light;

  ThemeNotifier({required this.manager}) {
    _init();
  }

  _init() async {
    await manager.init();
    getTheme();
  }

  void changeTheme() {
    if (currentThemeEnum == AppThemes.light) {
      currentTheme = AppThemeDark.instance.theme;
      currentThemeEnum = AppThemes.dark;
    } else {
      currentTheme = AppThemeLight.instance.theme;
      currentThemeEnum = AppThemes.light;
    }
    notifyListeners();
    manager.putItem(HiveConstants.appThemeKey, currentThemeEnum);
  }

  void getTheme() {
    AppThemes? theme = manager.getItem(HiveConstants.appThemeKey);
    if (theme == AppThemes.light || theme == null) {
      currentTheme = AppThemeLight.instance.theme;
      currentThemeEnum = AppThemes.light;
    } else {
      currentTheme = AppThemeDark.instance.theme;
      currentThemeEnum = AppThemes.dark;
    }
    notifyListeners();
  }
}
