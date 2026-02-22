import 'dart:async';

import 'package:buff_lisa/data/entity/cache_entity.dart';

import 'package:buff_lisa/util/core/cache_api.dart';
import 'package:buff_lisa/util/core/fast_hash.dart';
import 'package:flutter/foundation.dart';

abstract class InMemoryCache<T extends CacheEntity> implements CacheApi<T> {

  @protected
  final Map<int, T> cache = {};
  final int maxItems;
  final Duration? ttlDuration;

  InMemoryCache({this.maxItems = 100, this.ttlDuration = const Duration(days: 1)});


  @override
  Future<void> put(T item) async {
    if (maxItems > 0 && cache.length >= maxItems) {
      await deleteOldestItems();
    }
    cache[item.isarId] = item;
  }

  @override
  Future<T?> get(String id) async {
    return cache[fastHash(id)];
  }

  @override
  Future<void> delete(String id) async {
    cache.remove(fastHash(id));
  }

  @override
  Future<List<T>> getAll() async {
    return cache.values.toList();
  }


  @override
  Future<void> deleteAll() async {
    cache.clear();
  }

  @override
  Future<List<T?>> getList(List<String> ids) async {
    final List<T?> result = [];
    for (final id in ids) {
      result.add(cache[fastHash(id)]);
    }
    return result;
  }

  @override
  Future<void> putMultiple(List<T> items) async {
    for (final entry in items) {
      await put(entry);
    }
  }

  /// Delete items with the lowest hit count.
  /// Not included are items with keepAlive == true and items younger than 10% of ttlDuration
  @override
  Future<void> deleteOldestItems() async {

    final entries = cache.entries.toList();

    entries.sort((a, b) {
      final aHits = a.value.hits;
      final bHits = b.value.hits;
      return aHits.compareTo(bHits);
    });

    final itemsToDelete = cache.length - maxItems;
    int itemsDeleted = 0;
    final duration = ttlDuration != null ? (ttlDuration!.inSeconds * 0.1).toInt() : 3600;
    final ttlTime = DateTime.now().subtract(Duration(seconds: duration));

    for (int i = 0; i < entries.length && itemsDeleted < itemsToDelete; i++) {
      final key = entries[i].key;
      final value = cache[key]!;
      if (value.keepAlive == false && value.ttl.isBefore(ttlTime)) {
        cache.remove(key);
        itemsDeleted++;
      }
    }
  }
}
