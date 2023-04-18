import 'package:hive_flutter/hive_flutter.dart';

import '../../core/base/base_cache_manager.dart';
import '../constant/hive_constant.dart';
import '../model/taskModel/task_model.dart';

class TaskCacheManager extends BaseCacheManager<TaskModel> {
  TaskCacheManager({required String boxName}) : super(boxName);

  @override
  Future<void> addItems(List<TaskModel> items) async {
    await box?.addAll(items);
  }

  @override
  Future<void> putItems(List<TaskModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  TaskModel? getItem(String key) {
    return box?.get(key);
  }

  @override
  Future<void> putItem(String key, TaskModel item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> deleteAllItems() async {
    await box?.deleteFromDisk();
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  Future<List<TaskModel>?> getItems() async {
    return box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.taskTypeId)) {
      Hive.registerAdapter(TaskModelAdapter());
    }
  }
}
