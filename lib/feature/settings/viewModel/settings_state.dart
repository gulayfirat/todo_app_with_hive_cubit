part of 'settings_cubit.dart';

// ignore: must_be_immutable
class SettingsState extends Equatable {
  SettingsState({this.selectedLanguage, this.appThemes = AppThemes.light, this.currentTheme});
  final String? selectedLanguage;
  final AppThemes appThemes;
  ThemeData? currentTheme = AppThemeLight.instance.theme;

  @override
  List<Object?> get props => [selectedLanguage, appThemes, currentTheme];

  SettingsState copyWith({String? selectedLanguage, AppThemes? appThemes, ThemeData? currentTheme}) {
    return SettingsState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      appThemes: appThemes ?? this.appThemes,
      currentTheme: currentTheme ?? this.currentTheme,
    );
  }
}
