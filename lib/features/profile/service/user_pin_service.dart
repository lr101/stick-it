
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/dto/pin_dto.dart';
import '../../../data/service/user_group_service.dart';

part 'user_pin_service.g.dart';

@Riverpod(keepAlive: true)
class UserPinService extends _$UserPinService {


  @override
  Future<List<LocalPinDto>> build() async {
    final pinApi = ref.watch(pinApiProvider);
    final userId = ref.watch(userIdProvider);
    final pins = await pinApi.getPinImagesByIds(userId: userId, withImage: false);
    if (pins == null) throw Exception('Failed to get pins');
    final localPins = pins.items.map((e) => LocalPinDto.fromDtoWithImage(e)).toList();
    localPins.sort((a, b) => b.creationDate.compareTo(a.creationDate));
    return localPins;
  }

}

@riverpod
Future<List<LocalPinDto>> userPin(Ref ref) async {
  return await ref.watch(userPinServiceProvider.future);
}

@riverpod
int? numberOfGroup(Ref ref) {
  return ref.watch(userGroupServiceProvider.select((e) => e.value?.length));
}