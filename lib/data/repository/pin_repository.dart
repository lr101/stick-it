
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/data/entity/pin_like_entity.dart';
import 'package:buff_lisa/data/repository/isar_repo.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:buff_lisa/util/core/fast_hash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_repository.g.dart';


class PinRepository extends CacheImpl<PinEntity>  {

  PinRepository({required super.box, required super.isar, super.maxItems, super.ttlDuration});

  Future<Stream<List<PinEntity>>> getPinsByGroup(String groupId) async {
    return box.filter().groupFastIdEqualTo(fastHash(groupId)).build().watch(fireImmediately: true);
  }

  Future<Stream<List<PinEntity>>> getPinsByUser(String userId) async {
    return box.filter().creatorFastIdEqualTo(fastHash(userId)).build().watch(fireImmediately: true);
  }
  
  Future<void> deleteByGroupId(String groupId) async {
    await box.filter().groupIdEqualTo(groupId).deleteAll();
  }  

  Future<void> updateKeepAlive(String groupId, bool keepAlive, bool onlySession) async {
    final all = await box.filter().groupFastIdEqualTo(fastHash(groupId)).findAll();
    final updated = all.map((e) => e.copyWith(keepAlive: keepAlive, onlySession: onlySession) as PinEntity).toList();
    await box.putAll(updated);
  }

}

class PinLikeRepository extends CacheImpl<PinLikeEntity> {
  PinLikeRepository({required super.box, required super.isar, super.maxItems, super.ttlDuration});
}

@Riverpod(keepAlive: true)
PinRepository pinRepository(Ref ref) {
  final isar = ref.watch(isarRepoProvider);
  return PinRepository(isar: isar, box: isar.pinEntitys);
}

@Riverpod(keepAlive: true)
PinLikeRepository pinLikeRepository(Ref ref) { 
  final isar = ref.watch(isarRepoProvider);
  return PinLikeRepository(isar:isar, box: isar.pinLikeEntitys, maxItems: 50, ttlDuration: const Duration(hours: 1));
}
