import 'package:hive_flutter/hive_flutter.dart';

import '../../core/base/base_cache_manager.dart';
import '../constant/hive_constant.dart';
import '../model/noteModel/note_model.dart';

class NoteCacheManager extends BaseCacheManager<NoteModel> {
  NoteCacheManager({required String boxName}) : super(boxName);

  @override
  Future<void> addItems(List<NoteModel> items) async {
    await box?.addAll(items);
  }

  @override
  Future<void> putItems(List<NoteModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  NoteModel? getItem(String key) {
    return box?.get(key);
  }

  @override
  Future<void> putItem(String key, NoteModel item) async {
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
  Future<List<NoteModel>?> getItems() async {
    return box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.noteTypeId)) {
      Hive.registerAdapter(NoteModelAdapter());
    }
  }
}
