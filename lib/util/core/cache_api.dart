

abstract class CacheApi<T> {
  Future<void> put(T item);
  Future<T?> get(String id);
  Future<void> delete(String id);
  Future<List<T>> getAll();
  Future<List<T?>> getList(List<String> ids);
  Future<void> deleteAll();
  Future<void> putMultiple(List<T> items);
  Future<void> deleteOldestItems();
}
