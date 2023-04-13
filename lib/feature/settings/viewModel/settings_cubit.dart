import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/enum/theme/app_themes.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/language_manager.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/lightTheme/theme_light.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState());
  List<String> languageList = [
    LocaleKeys.SettingsView_enLanguage.locale,
    LocaleKeys.SettingsView_trLanguage.locale,
  ];
  String? selectedLanguage;

  void onChangeLanguage(BuildContext context, value) {
    if (value == LocaleKeys.SettingsView_enLanguage.locale) {
      selectedLanguage = value;
      context.setLocale(LanguageManager.instance.enLocale);
    } else if (value == LocaleKeys.SettingsView_trLanguage.locale) {
      selectedLanguage = value;
      context.setLocale(LanguageManager.instance.trLocale);
    }
    emit(state.copyWith(selectedLanguage: selectedLanguage));
  }

  void getSelectedLanguage(BuildContext context) {
    if (context.locale == LanguageManager.instance.trLocale) {
      selectedLanguage = languageList[1];
    } else if (context.locale == LanguageManager.instance.enLocale) {
      selectedLanguage = languageList[0];
    } else {
      selectedLanguage = languageList[1];
    }
    emit(state.copyWith(selectedLanguage: selectedLanguage));
  }
}
