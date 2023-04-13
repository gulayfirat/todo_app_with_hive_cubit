import 'package:easy_localization/easy_localization.dart';

import '../constant/note_card_colors_constant.dart';

extension ColorCodeExtension on String {
  //BackgroundNoteCardColors get instance=>BackgroundNoteCardColors.instance;
  get getColors {
    switch (this) {
      case "white":
        return BackgroundNoteCardColors.instance.white;
      case "broadDaylight":
        return BackgroundNoteCardColors.instance.broadDaylight;
      case "eucalyptusLeaf":
        return BackgroundNoteCardColors.instance.eucalyptusLeaf;
      case "pinkFlare":
        return BackgroundNoteCardColors.instance.pinkFlare;
      case "shyMoment":
        return BackgroundNoteCardColors.instance.shyMoment;
      case "cinqueFoil":
        return BackgroundNoteCardColors.instance.cinqueFoil;
      default:
        return BackgroundNoteCardColors.instance.white;
    }
  }
}

extension DateFormatExtension on String {
  get dateFormat => DateFormat('dd/MM/yyyy, HH:mm').format(DateTime.parse(this));
}
