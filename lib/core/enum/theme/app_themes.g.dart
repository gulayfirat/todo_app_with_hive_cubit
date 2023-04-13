// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_themes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppThemesAdapter extends TypeAdapter<AppThemes> {
  @override
  final int typeId = 3;

  @override
  AppThemes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AppThemes.light;
      case 1:
        return AppThemes.dark;
      default:
        return AppThemes.light;
    }
  }

  @override
  void write(BinaryWriter writer, AppThemes obj) {
    switch (obj) {
      case AppThemes.light:
        writer.writeByte(0);
        break;
      case AppThemes.dark:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppThemesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
