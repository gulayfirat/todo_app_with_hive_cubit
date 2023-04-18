import 'package:hive/hive.dart';

abstract class BaseCacheManager<T> {
  final String key;
  //T type the hive box
  Box<T>? box;

  BaseCacheManager(this.key);
  //Initial manager
  Future<void> init() async {
    registerAdapters();
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox(key);
    }
  }

  //Register hive adapters
  void registerAdapters();
  //Delete all items from hive
  Future<void> deleteAllItems() async {
    await box?.deleteFromDisk();
  }

//Add all items to hive
  Future<void> addItems(List<T> items);
  Future<void> putItems(List<T> items);
//Just fetches an item from hive
  T? getItem(String key);
//Fetches all items from hive
  Future<List<T>?> getItems();
//Add or update item to hive
  Future<void> putItem(String key, T item);
//Delete just an item from hive
  Future<void> removeItem(String key);
}
