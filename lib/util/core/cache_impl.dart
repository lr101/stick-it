import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:buff_lisa/util/core/cache_api.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

abstract class CacheImpl<T extends CacheEntity> implements CacheApi<T> {
  final String boxName;
  final int? maxItems;
  final Duration? ttlDuration;

  CacheImpl(this.boxName, {this.maxItems, this.ttlDuration});

  @protected
  Box<T>? box;

  @protected
  Future<Box<T>> openBox() async {
    if (box != null) return box!;
    box = await Hive.openBox<T>(boxName);
    await _removeByTTL();
    return box!;
  }

  @override
  Future<void> put(String id, T item) async {
    final box = await openBox();
    await box.put(id, item);
    if (maxItems != null && box.length > maxItems!) {
      deleteOldestItems();
    }
  }

  @override
  Future<T?> get(String id) async {
    final box = await openBox();
    final result = box.get(id);
    final resultWithHits = result?.copyWith(hits: result.hits + 1);
    if (resultWithHits != null) await box.put(id, resultWithHits as T);
    return result;
  }

  @override
  Future<void> delete(String id) async {
    final box = await openBox();
    await box.delete(id);
  }

  @override
  Future<List<T>> getAll() async {
    final box = await openBox();
    return box.values.toList();
  }

  @override
  Future<Map<String, T>> getAllAsMap() async {
    final box = await openBox();
    final Map<String, T> resultMap = {};

    for (final key in box.keys) {
      resultMap[key as String] = box.get(key)!;
    }

    return resultMap;
  }

  @override
  Future<void> deleteAll() async {
    final box = await openBox();
    await box.clear();
  }

  @override
  Future<void> deleteByFilter(bool Function(T) filter) async {
    final box = await openBox();
    final values = box.toMap();
    values.removeWhere((_, value) => filter(value));
    await box.clear();
    await box.putAll(values);
  }

  @override
  Future<void> putMultiple(Map<String, T> items) async {
    final box = await openBox();
    await box.putAll(items);
    if (maxItems != null && box.length > maxItems!) {
      await deleteOldestItems();
    }
  }

  Future<void> _removeByTTL() async {
    if (ttlDuration != null) {
      final values = box!.toMap();
      final ttlTime = DateTime.now().subtract(ttlDuration!);
      values.removeWhere((a, b) => b.ttl.isBefore(ttlTime));
      await box!.clear();
      await box!.putAll(values);
    }
  }

  /// Delete the items with the lowest hit count
  /// Not included are items with keepAlive == true and items younger than 10% of ttlDuration
  @override
  Future<void> deleteOldestItems() async {
    final values = box!.toMap();
    if (maxItems == null || maxItems! >= values.length) return;

    final entries = values.entries.toList();

    entries.sort((a, b) {
      final aHits = a.value.hits;
      final bHits = b.value.hits;
      return aHits.compareTo(bHits);
    });

    final itemsToDelete = box!.length - maxItems!;
    int itemsDeleted = 0;
    final duration = ttlDuration != null ? (ttlDuration!.inSeconds * 0.1).toInt() : 3600;
    final ttlTime = DateTime.now().subtract(Duration(seconds: duration));

    for (int i = 0; i < entries.length && itemsDeleted < itemsToDelete; i++) {
      final key = entries[i].key;
      final value = values[key]!;
      if (value.keepAlive == false && value.ttl.isBefore(ttlTime)) {
        await box!.delete(key);
        itemsDeleted++;
      }
    }
  }

}
