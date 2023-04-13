import 'package:hive_flutter/adapters.dart';

import '../../../core/base/base_model.dart';
import '../../constant/hive_constant.dart';

part 'note_model.g.dart';

@HiveType(typeId: HiveConstants.noteTypeId)
class NoteModel extends BaseModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  DateTime? createDate;
  @HiveField(2)
  DateTime? updateDate;
  @HiveField(3)
  String? note;
  @HiveField(6)
  String? colorName;
  NoteModel({
    this.id,
    this.createDate,
    this.updateDate,
    this.note,
    this.colorName,
  });

  @override
  NoteModel createObject() {
    return NoteModel();
  }

  @override
  fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson() {
    throw UnimplementedError();
  }
}
