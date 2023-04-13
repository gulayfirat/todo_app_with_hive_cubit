import 'package:hive_flutter/adapters.dart';

import '../../../core/base/base_model.dart';
import '../../constant/hive_constant.dart';

part 'task_model.g.dart';

@HiveType(typeId: HiveConstants.taskTypeId)
class TaskModel extends BaseModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  DateTime? createDate;
  @HiveField(2)
  DateTime? updateDate;
  @HiveField(3)
  String? task;
  @HiveField(4)
  bool? isComplete;
  TaskModel({
    this.id,
    this.createDate,
    this.updateDate,
    this.task,
    this.isComplete,
  });

  @override
  TaskModel createObject() {
    return TaskModel();
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
