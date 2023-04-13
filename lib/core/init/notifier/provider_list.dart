import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../product/constant/hive_constant.dart';
import '../../../product/manager/theme_manager.dart';
import 'theme_notifier.dart';

class ApplicationProvider {
  ApplicationProvider._init();
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier(manager: AppThemeManager(boxName: HiveConstants.appThemeBoxName))),
  ];
}
