import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/core/enum/language_items.dart';
import 'package:todo_application/core/extension/language_extension.dart';

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
      emit(state.copyWith(selectedLanguage: selectedLanguage));
      return;
    }
    if (value == LocaleKeys.SettingsView_trLanguage.locale) {
      selectedLanguage = value;
      context.setLocale(LanguageManager.instance.trLocale);
      emit(state.copyWith(selectedLanguage: selectedLanguage));
      return;
    }
  }

  void getSelectedLanguage(BuildContext context) {
    if (context.locale == LanguageManager.instance.enLocale) {
      selectedLanguage = LanguageItems.en.getLocalLanguage();
      emit(state.copyWith(selectedLanguage: selectedLanguage));
      return;
    }
    if (context.locale == LanguageManager.instance.trLocale) {
      selectedLanguage = LanguageItems.tr.getLocalLanguage();
      emit(state.copyWith(selectedLanguage: selectedLanguage));
      return;
    }
    selectedLanguage = LanguageItems.en.getLocalLanguage();
    emit(state.copyWith(selectedLanguage: selectedLanguage));
  }
}
