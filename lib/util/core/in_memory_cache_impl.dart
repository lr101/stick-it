import 'dart:async';

import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:buff_lisa/util/core/cache_api.dart';
import 'package:buff_lisa/util/core/fast_hash.dart';
import 'package:flutter/foundation.dart';
import 'package:select_dialog/rxdart/behavior_subject.dart';

abstract class InMemoryCache<T extends CacheEntity> implements CacheApi<T> {

  @protected
  final Map<int, T> cache = {};
  final int maxItems;
  final Duration? ttlDuration;

  final _controller = BehaviorSubject<Map<int, T>>.seeded({});
  Stream<Map<int, T>> get cacheChanges => _controller.stream;

  InMemoryCache({this.maxItems = 100, this.ttlDuration = const Duration(days: 1)});

  @override
  Stream<T?> watchById(String id)  {
    return cacheChanges.map(
      (e) => e[fastHash(id)],
    );
  }

  @override
  Future<void> put(T item) async {
    debugPrint(item.isarId.toString() + item.runtimeType.toString());
    cache[item.isarId] = item.copyWith() as T;
    _controller.add(Map.of(cache));
  }

  @override
  Future<void> putMultiple(Iterable<T> items) async {
    if (items.isEmpty) return;

    for (final entry in items) {
      cache[entry.isarId] = entry.copyWith() as T;
    }
    
    if (maxItems > 0 && cache.length > maxItems) {
      await deleteOldestItems();
    }
    
    // 2. Fire exactly ONE event signifying a bulk update (null = global change)
    _controller.add(Map.of(cache));
  }

  @override
  Future<T?> get(String id) async {
    return cache[fastHash(id)];
  }

  @override
  Future<void> delete(String id) async {
    final key = fastHash(id);
    if (cache.containsKey(key)) {
      cache.remove(key);
      _controller.add(Map.of(cache));
    }
  }

  @override
  Future<void> deleteMultiple(List<String> ids) async {
    if (ids.isEmpty) return;
    
    bool changed = false;
    for (final id in ids) {
      final key = fastHash(id);
      if (cache.containsKey(key)) {
        cache.remove(key);
        changed = true;
      }
    }
    
    // Only notify once for the whole deletion batch
    if (changed) _controller.add(Map.of(cache));
  }

  @override
  Future<List<T>> getAll() async {
    return cache.values.toList();
  }

  @override
  Future<void> deleteAll() async {
    cache.clear();
    _controller.add(Map.of(cache));
  }

  @override
  Future<List<T?>> getList(List<String> ids) async {
    return ids.map((id) => cache[fastHash(id)]).toList();
  }

  @override
  Future<void> deleteOldestItems() async {
    final entries = cache.entries.toList();

    entries.sort((a, b) => a.value.hits.compareTo(b.value.hits));

    final itemsToDelete = cache.length - maxItems;
    int itemsDeleted = 0;
    final duration = ttlDuration != null ? (ttlDuration!.inSeconds * 0.1).toInt() : 3600;
    final ttlTime = DateTime.now().subtract(Duration(seconds: duration));
    
    bool changed = false;

    for (int i = 0; i < entries.length && itemsDeleted < itemsToDelete; i++) {
      final key = entries[i].key;
      final value = cache[key]!;
      if (value.keepAlive == false && value.ttl.isBefore(ttlTime)) {
        cache.remove(key);
        itemsDeleted++;
        changed = true;
      }
    }
    
    // Notify once for the cleanup
    if (changed) _controller.add(Map.of(cache));
  }

}
