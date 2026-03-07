
import 'dart:async';

import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/data/entity/pin_like_entity.dart';
import 'package:buff_lisa/data/repository/isar_repo.dart';
import 'package:buff_lisa/util/core/cache_api.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:buff_lisa/util/core/fast_hash.dart';
import 'package:buff_lisa/util/core/in_memory_cache_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_repository.g.dart';


abstract class IPinRepository implements CacheApi<PinEntity> {
  Stream<List<PinEntity>> getPinsByGroup(String groupId);
  Stream<List<PinEntity>> getPinsByUser(String userId);
  Future<void> deleteByGroupId(String groupId);
  Future<void> replacePin(String oldPinId, PinEntity newPin);
  Future<void> updateKeepAlive(String groupId, bool keepAlive, bool onlySession);
}

abstract class IPinLikeRepository implements CacheApi<PinLikeEntity> {}

class PinRepository extends CacheImpl<PinEntity> implements IPinRepository {

  PinRepository({required super.box, required super.isar, super.maxItems, super.ttlDuration});

  @override
  Stream<List<PinEntity>> getPinsByGroup(String groupId) {
    return box.filter().groupFastIdEqualTo(fastHash(groupId)).build().watch(fireImmediately: true);
  }

  @override
  Stream<List<PinEntity>> getPinsByUser(String userId) {
    return box.filter().creatorFastIdEqualTo(fastHash(userId)).build().watch(fireImmediately: true);
  }
  
  @override
  Future<void> deleteByGroupId(String groupId) async {
    await box.filter().groupIdEqualTo(groupId).deleteAll();
  }

  @override
  Future<void> replacePin(String oldPinId, PinEntity newPin) async {
    await isar.writeTxn(() async {
      await box.delete(fastHash(oldPinId));
      await box.put(newPin);
    });
  }

  @override
  Future<void> updateKeepAlive(String groupId, bool keepAlive, bool onlySession) async {
    final all = await box.filter().groupFastIdEqualTo(fastHash(groupId)).findAll();
    final updated = all.map((e) => e.copyWith(keepAlive: keepAlive, onlySession: onlySession) as PinEntity).toList();
    await box.putAll(updated);
  }

}

class PinRepositoryWeb extends InMemoryCache<PinEntity> implements IPinRepository {
  PinRepositoryWeb({super.maxItems, super.ttlDuration});

  @override
  Stream<List<PinEntity>> getPinsByGroup(String groupId) {
    return cacheChanges.map(
      (e) => e.values.where((p) => p.groupId == groupId).toList(),
    );
  }

  @override
  Stream<List<PinEntity>> getPinsByUser(String userId) {
    return cacheChanges.map(
      (e) => e.values.where((p) => p.creator == userId).toList(),
    );
  }

  
  @override
  Future<void> deleteByGroupId(String groupId) async {
    final keysToRemove = cache.values
        .where((pin) => pin.groupId == groupId)
        .map((pin) => pin.isarId)
        .toList();

    for (final key in keysToRemove) {
      cache.remove(key);
    }
    // Simplest way to trigger a refresh for the streams
    putMultiple([]); 
  }

  @override
  Future<void> replacePin(String oldPinId, PinEntity newPin) async {
    await delete(oldPinId);
    await put(newPin);
  }

  @override
  Future<void> updateKeepAlive(String groupId, bool keepAlive, bool onlySession) async {
    final hashedId = fastHash(groupId);
    final toUpdate = cache.values.where((pin) => fastHash(pin.groupId) == hashedId).toList();
    
    for (final pin in toUpdate) {
      final updatedPin = pin.copyWith(keepAlive: keepAlive, onlySession: onlySession) as PinEntity;
      await put(updatedPin);
    }
  }
}

class PinLikeRepositoryWeb extends InMemoryCache<PinLikeEntity> implements IPinLikeRepository {
  PinLikeRepositoryWeb({super.maxItems, super.ttlDuration});
}

class PinLikeRepository extends CacheImpl<PinLikeEntity> implements IPinLikeRepository  {
  PinLikeRepository({required super.box, required super.isar, super.maxItems, super.ttlDuration});
}

@Riverpod(keepAlive: true)
IPinRepository pinRepository(Ref ref) {
  if (kIsWeb) return PinRepositoryWeb();
  final isar = ref.watch(isarRepoProvider);
  return PinRepository(isar: isar, box: isar.pinEntitys);
}

@Riverpod(keepAlive: true)
IPinLikeRepository pinLikeRepository(Ref ref) { 
  if (kIsWeb) return PinLikeRepositoryWeb();
  final isar = ref.watch(isarRepoProvider);
  return PinLikeRepository(isar:isar, box: isar.pinLikeEntitys, maxItems: 50, ttlDuration: const Duration(hours: 1));
}
