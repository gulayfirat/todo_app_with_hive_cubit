import 'package:todo_application/core/enum/language_items.dart';
import 'package:todo_application/core/extension/string_extension.dart';
import '../init/lang/locale_keys.g.dart';

extension LanguageItemsExtension on LanguageItems {
  String getLocalLanguage() {
    switch (this) {
      case LanguageItems.tr:
        return LocaleKeys.SettingsView_trLanguage.locale;
      case LanguageItems.en:
        return LocaleKeys.SettingsView_enLanguage.locale;
    }
  }
}
