import 'package:fingerprint_aps/app/core/local_storage/local_storage.dart';
import 'package:hive/hive.dart';

class HiveLocalStorage implements LocalStorage {
  HiveLocalStorage({
    required this.boxKey,
  });

  final String boxKey;

  Future<Box> get _instance => Hive.openBox(boxKey);
  
  Future<void> _closeBox() async {
    await Hive.close();
  }

  @override
  Future<void> clear() async {
    final _box = await _instance;
    await _box.clear();
    await _closeBox();
  }

  @override
  Future<bool> contains(String key) async {
    final _box = await _instance;
    final containsKey = _box.containsKey(key);
    await _closeBox();
    return containsKey;
  }

  @override
  Future<T?> read<T>(String key) async {
    final _box = await _instance;
    final T? value = await _box.get(key);
    await _closeBox();
    return value;
  }

  @override
  Future<void> remove(String key) async {
    final _box = await _instance;
    await _box.delete(key);
    await _closeBox();
  }

  @override
  Future<void> write<T>(String key, T value) async {
    final _box = await _instance;
    await _box.put(key, value);
    await _closeBox();
  }
}