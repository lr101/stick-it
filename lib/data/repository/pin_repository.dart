
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/data/entity/pin_like_entity.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:buff_lisa/util/core/in_memory_cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_repository.g.dart';

abstract class PinRepositoryApi {
  Future<Set<LocalPinDto>> getPinsByGroup(String groupId);
}

class PinRepository extends CacheImpl<PinEntity> implements PinRepositoryApi  {

  PinRepository() : super("pinRepository");

  @override
  Future<Set<LocalPinDto>> getPinsByGroup(String groupId) async {
    final pins = await getAll();
    final filteredPins = pins.where((e) => e.group == groupId);
    return filteredPins.map((e) => LocalPinDto.fromEntityData(e)).toSet();
  }

}

class OtherPinRepository extends InMemoryCache<PinEntity> implements PinRepositoryApi {

  @override
  Future<Set<LocalPinDto>> getPinsByGroup(String groupId) async {
    final pins = await getAll();
    final filteredPins = pins.where((e) => e.group == groupId);
    return filteredPins.map((e) => LocalPinDto.fromEntityData(e)).toSet();
  }

}

class PinLikeRepository extends CacheImpl<PinLikeEntity> {
  PinLikeRepository(): super("pinLikeRepository", maxItems: 50, ttlDuration: const Duration(hours: 1));
}

@Riverpod(keepAlive: true)
PinRepository pinRepository(Ref ref) {
  return PinRepository();
}

@Riverpod(keepAlive: true)
OtherPinRepository otherPinRepository(Ref ref) => OtherPinRepository();

@Riverpod(keepAlive: true)
PinLikeRepository pinLikeRepository(Ref ref) => PinLikeRepository();
