import 'package:hive/hive.dart';

import '../../../product/constant/hive_constant.dart';

part 'app_themes.g.dart';

@HiveType(typeId: HiveConstants.themeTypeId)
enum AppThemes {
  @HiveField(0)
  light,
  @HiveField(1)
  dark
}
