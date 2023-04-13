import 'package:flutter/material.dart';

class BackgroundNoteCardColors {
  BackgroundNoteCardColors._init();
  static BackgroundNoteCardColors? _instance;
  static BackgroundNoteCardColors get instance {
    return _instance ??= BackgroundNoteCardColors._init();
  }

  final Color white = const Color(0xFFFFFFFF);
  final Color broadDaylight = const Color(0xFFBBDEFB);
  final Color eucalyptusLeaf = const Color(0xFFBBD6B8);
  final Color pinkFlare = const Color(0xFFD5B4B4);
  final Color shyMoment = const Color(0xFFB2A4FF);
  final Color cinqueFoil = const Color(0xFFFEFF86);

  List<Color> get getColorList => [
        BackgroundNoteCardColors.instance.white,
        BackgroundNoteCardColors.instance.broadDaylight,
        BackgroundNoteCardColors.instance.eucalyptusLeaf,
        BackgroundNoteCardColors.instance.pinkFlare,
        BackgroundNoteCardColors.instance.shyMoment,
        BackgroundNoteCardColors.instance.cinqueFoil,
      ];
  String? getColorName(Color color) {
    if (color == BackgroundNoteCardColors.instance.white) {
      return "white";
    } else if (color == BackgroundNoteCardColors.instance.broadDaylight) {
      return "broadDaylight";
    } else if (color == BackgroundNoteCardColors.instance.eucalyptusLeaf) {
      return "eucalyptusLeaf";
    } else if (color == BackgroundNoteCardColors.instance.pinkFlare) {
      return "pinkFlare";
    } else if (color == BackgroundNoteCardColors.instance.shyMoment) {
      return "shyMoment";
    } else if (color == BackgroundNoteCardColors.instance.cinqueFoil) {
      return "cinqueFoil";
    }
    return null;
  }
}
