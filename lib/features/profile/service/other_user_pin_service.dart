
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/dto/pin_dto.dart';

part 'other_user_pin_service.g.dart';

@Riverpod(keepAlive: true)
class OtherUserPinService extends _$OtherUserPinService {


  @override
  Future<List<LocalPinDto>> build(String userId) async {
    final pinApi = ref.watch(pinApiProvider);
    final pins = await pinApi.getPinImagesByIds(userId: userId, withImage: false);
    if (pins == null) throw Exception('Failed to get pins');
    final localPins = pins.items.map((e) => LocalPinDto.fromDtoWithImage(e)).toList();
    localPins.sort((a, b) => b.creationDate.compareTo(a.creationDate));
    return localPins;
  }

}

@riverpod
Future<List<LocalPinDto>> otherUserPin(Ref ref, String userId) async {
  return await ref.watch(otherUserPinServiceProvider(userId).future);
}