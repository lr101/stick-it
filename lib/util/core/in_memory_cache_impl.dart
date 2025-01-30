import 'dart:async';

import 'package:buff_lisa/data/entity/cache_entity.dart';

import 'package:buff_lisa/util/core/cache_api.dart';

abstract class InMemoryCache<T extends CacheEntity> implements CacheApi<T> {
  final Map<String, T> _cache = {};
  final int maxItems;
  final Duration? ttlDuration;

  InMemoryCache({this.maxItems = 100, this.ttlDuration = const Duration(days: 1)});

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
  Future<void> deleteByFilter(bool Function(T) filter) async {
    _cache.removeWhere((key, value) => filter(value));
  }

  @override
  Future<void> putMultiple(Map<String, T> items) async {
    for (final entry in items.entries) {
      await put(entry.key, entry.value);
    }
  }

  /// Delete items with the lowest hit count.
  /// Not included are items with keepAlive == true and items younger than 10% of ttlDuration
  @override
  Future<void> deleteOldestItems() async {

    final entries = _cache.entries.toList();

    entries.sort((a, b) {
      final aHits = a.value.hits;
      final bHits = b.value.hits;
      return aHits.compareTo(bHits);
    });

    final itemsToDelete = _cache.length - maxItems;
    int itemsDeleted = 0;
    final duration = ttlDuration != null ? (ttlDuration!.inSeconds * 0.1).toInt() : 3600;
    final ttlTime = DateTime.now().subtract(Duration(seconds: duration));

    for (int i = 0; i < entries.length && itemsDeleted < itemsToDelete; i++) {
      final key = entries[i].key;
      final value = _cache[key]!;
      if (value.keepAlive == false && value.ttl.isBefore(ttlTime)) {
        _cache.remove(key);
        itemsDeleted++;
      }
    }
  }
}
