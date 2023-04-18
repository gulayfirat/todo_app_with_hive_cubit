import 'package:hive/hive.dart';

import '../../core/base/base_cache_manager.dart';
import '../../core/enum/theme/app_themes.dart';
import '../constant/hive_constant.dart';

class AppThemeManager extends BaseCacheManager<AppThemes> {
  AppThemeManager({required String boxName}) : super(boxName);

  @override
  Future<void> addItems(List<AppThemes> items) async {
    await box?.addAll(items);
  }

  @override
  Future<void> putItems(List<AppThemes> items) async {}

  @override
  AppThemes? getItem(String key) {
    return box?.get(key);
  }

  @override
  Future<void> putItem(String key, AppThemes item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> deleteAllItems() async {
    await box?.deleteFromDisk();
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  Future<List<AppThemes>?> getItems() async {
    return box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.themeTypeId)) {
      Hive.registerAdapter(AppThemesAdapter());
    }
  }
}
