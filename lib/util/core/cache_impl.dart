import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:buff_lisa/util/core/cache_api.dart';
import 'package:buff_lisa/util/core/fast_hash.dart';
import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';

typedef GetOne = Future<CacheEntity?> Function(String);

abstract class CacheImpl<T extends CacheEntity> implements CacheApi<T> {
  final int? maxItems;
  final Duration? ttlDuration;
  
  

  CacheImpl({required this.box, required this.isar, this.maxItems, this.ttlDuration}) {
    startup();
  }

  @protected
  final IsarCollection<T> box;

  @protected
  final Isar isar;

  @override
  Future<void> put(T item) async {
    await isar.writeTxn(() async {
      await box.put(item);
      if (maxItems != null && await box.getSize() > maxItems!) {
        await deleteOldestItems();
      }
    });
  }

  @override
  Stream<T?> watchById(String id) {
    return box.watchObject(fastHash(id), fireImmediately: true);
  }

  @override
  Future<T?> get(String id) async {
      return await box.get(fastHash(id));
  }

  @override
  Future<void> delete(String id) async {
    await isar.writeTxn(() async => await box.delete(fastHash(id)));
  }

  @override
  Future<void> deleteMultiple(List<String> ids) async {
    final fastIds = ids.map(fastHash).toList();
    await isar.writeTxn(() async =>  await box.deleteAll(fastIds));
  }

  @override
  Future<List<T>> getAll() async {
    return await box.where().findAll();
  }

  @override
  Future<void> deleteAll() async {
    await isar.writeTxn(() async =>  await box.clear());
  }

  @override
  Future<void> putMultiple(Iterable<T> items) async {
    await isar.writeTxn(() async {
      await box.putAll(items.toList());
      if (maxItems != null && await box.getSize() > maxItems!) {
        await deleteOldestItems();
      }
    });
  }

  @override
  Future<List<T?>> getList(List<String> ids) async {
    return await box.getAll(ids.map(fastHash).toList());
  }

  @protected
  void startup() {
    DateTime? ttlTime;
    if (ttlDuration != null) {
      ttlTime = DateTime.now().subtract(ttlDuration!);
    }

    isar.writeTxn(() async {
      // clear all from previous session and where TTL is expired
      final all = await box.where().findAll();
      final filtered = all.where((entry) => (entry.onlySession && !entry.keepAlive) || (ttlTime != null && entry.keepAlive == false && entry.ttl.isBefore(ttlTime)));
      await box.deleteAll(filtered.map((e) => e.isarId).toList());
    });

  }

  @override
  Future<void> deleteOldestItems() async {

      final size = await isar.getSize();
      if (maxItems == null || maxItems! >= size) return;


      final entries = await box.where().findAll();

      entries.sort((a, b) {
        final aHits = a.hits;
        final bHits = b.hits;
        return aHits.compareTo(bHits);
      });

      final itemsToDelete = size - maxItems!;
      int itemsDeleted = 0;
      final duration = ttlDuration != null ? (ttlDuration!.inSeconds * 0.1).toInt() : 3600;
      final ttlTime = DateTime.now().subtract(Duration(seconds: duration));

      for (int i = 0; i < entries.length && itemsDeleted < itemsToDelete; i++) {
        if (entries[i].keepAlive == false && entries[i].ttl.isBefore(ttlTime)) {
          await box.delete(entries[i].isarId);
          itemsDeleted++;
        }
      }
  }

}
