import 'package:hive/hive.dart';

abstract class ICacheManager<T> {
  final String key;
  Box<T>? box;

  ICacheManager(this.key);
  Future<void> init() async {
    registerAdapters();
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox(key);
    }
  }

  void registerAdapters();

  Future<void> deleteAllItems() async {
    await box?.deleteFromDisk();
  }

  Future<void> addItems(List<T> items);
  Future<void> putItems(List<T> items);

  T? getItem(String key);
  Future<List<T>?> getItems();

  Future<void> putItem(String key, T item);
  Future<void> removeItem(String key);
}