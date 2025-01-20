import 'package:flutter/cupertino.dart';

import 'cache_api.dart';
import 'package:hive/hive.dart';

class CacheImpl<T> implements CacheApi<T> {
  final String boxName;
  final int? maxItems; // Optional max items for TTL

  CacheImpl(this.boxName, {this.maxItems});

  @protected
  Box<T>? box;

  @protected
  Future<Box<T>> openBox() async {
    box ??= await Hive.openBox<T>(boxName);
    return box!;
  }

  @override
  Future<void> put(String id, T item) async {
    final box = await openBox();
    await box.put(id, item);
    if (maxItems != null && box.length > maxItems!) {
      await deleteOldestItems();
    }
  }

  @override
  Future<T?> get(String id) async {
    final box = await openBox();
    return box.get(id);
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

    for (var key in box.keys) {
      resultMap[key] = box.get(key) as T;
    }

    return resultMap;
  }

  @override
  Future<void> deleteAll() async {
    final box = await openBox();
    await box.clear();
  }

  @override
  Future<void> putMultiple(Map<String, T> items) async {
    final box = await openBox();
    await box.putAll(items);
    if (maxItems != null && box.length > maxItems!) {
      await deleteOldestItems();
    }
  }

  @override
  Future<void> deleteOldestItems() async {
    final box = await openBox();
    final keys = box.keys.toList();
    for (int i = 0; i < (box.length - maxItems!); i++) {
      await box.delete(keys[i]);
    }
  }
}
