
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/pin_dto.dart';
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/data/entity/user_pins_entity.dart';
import 'package:buff_lisa/data/repository/user_pins_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_pin_service.g.dart';

@riverpod
class UserPinService extends _$UserPinService {

  late bool _isCurrentUser;

  @override
  Future<List<LocalPinDto>> build(String userId) async {
    final pinApi = ref.watch(pinApiProvider);
    final currentUserId = ref.watch(userIdProvider);
    final userPinsRepo = ref.watch(userPinsRepositoryProvider);
    _isCurrentUser = userId == currentUserId;
    final userPinsEntity = await userPinsRepo.get(userId);
    if (userPinsEntity != null) {
      final result = userPinsEntity.pins.map((e) => LocalPinDto.fromEntityData(e)).toList();
      result.sort((a, b) => b.creationDate.compareTo(a.creationDate));
      state = AsyncData(result);
    }
    try {
      final pins = await pinApi.getPinImagesByIds(userId: userId, withImage: false);
      final localPins = pins!.items.map((e) => LocalPinDto.fromDtoWithImage(e)).toList();
      final pinEntities =  pins.items.map((e) => PinEntity.fromDto(e)).toList();
      localPins.sort((a, b) => b.creationDate.compareTo(a.creationDate));
      userPinsRepo.put(userId, UserPinsEntity(pins: pinEntities, keepAlive: _isCurrentUser));
      return localPins;
    } catch(e) {
      if (kDebugMode) print(e);
      if (userPinsEntity != null) {
        return state.value!;
      } else {
        rethrow;
      }
    }
  }

  Future<void> addPin(LocalPinDto pin) async {
    if (state.value == null) return;
    final pins = [pin, ...state.value!];
    state = AsyncData(pins);
    final pinEntities = pins.map((e) => e.toEntityCompanion()).toList();
    await ref.read(userPinsRepositoryProvider).put(this.userId, UserPinsEntity(pins: pinEntities, keepAlive: _isCurrentUser));
  }

  Future<void> removePin(String pinId) async {
    if (state.value == null) return;
    final pins = state.value!.where((e) => e.id != pinId).toList();
    state = AsyncData(pins);
    final pinEntities = pins.map((e) => e.toEntityCompanion()).toList();
    await ref.read(userPinsRepositoryProvider).put(this.userId, UserPinsEntity(pins: pinEntities, keepAlive: _isCurrentUser));
  }

}

@riverpod
Future<List<LocalPinDto>> userPin(Ref ref, String userId) async {
  return await ref.watch(userPinServiceProvider(userId).future);
}

@riverpod
int? numberOfGroup(Ref ref) {
  return ref.watch(userGroupServiceProvider.select((e) => e.value?.length));
}
