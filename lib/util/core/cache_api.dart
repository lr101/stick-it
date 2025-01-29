
abstract class CacheApi<T> {
  Future<void> put(String id, T item);
  Future<T?> get(String id);
  Future<void> delete(String id);
  Future<List<T>> getAll();
  Future<Map<String, T>> getAllAsMap();
  Future<void> deleteAll();
  Future<void> putMultiple(Map<String, T> items);
  Future<void> deleteOldestItems();
}
