import 'dart:async';

import 'cache_api.dart';

abstract class InMemoryCache<T> implements CacheApi<T> {
  final Map<String, T> _cache = {};
  final int maxItems;

  InMemoryCache({this.maxItems = 100});

  @override
  Future<void> put(String id, T item) async {
    if (maxItems > 0 && _cache.length >= maxItems) {
      await deleteOldestItems();
    }
    _cache[id] = item;
  }

  @override
  Future<T?> get(String id) async {
    return _cache[id];
  }

  @override
  Future<void> delete(String id) async {
    _cache.remove(id);
  }

  @override
  Future<List<T>> getAll() async {
    return _cache.values.toList();
  }

  @override
  Future<Map<String, T>> getAllAsMap() async {
    return Map.from(_cache);
  }

  @override
  Future<void> deleteAll() async {
    _cache.clear();
  }

  @override
  Future<void> putMultiple(Map<String, T> items) async {
    for (var entry in items.entries) {
      await put(entry.key, entry.value);
    }
  }

  @override
  Future<void> deleteOldestItems() async {
    // If you want to implement a simple eviction policy, you can remove
    // the first N items based on the insertion order.
    if (_cache.isNotEmpty) {
      final keysToRemove = _cache.keys.take(1).toList(); // Remove the oldest item
      for (var key in keysToRemove) {
        _cache.remove(key);
      }
    }
  }
}
