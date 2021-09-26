abstract class LocalStorage {
  Future<bool> contains(String key);
  Future<void> remove(String key);
  Future<void> clear();
  Future<T?> read<T>(String key);
  Future<void> write<T>(String key, T value);
}