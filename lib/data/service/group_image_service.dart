


import 'dart:typed_data';

import 'package:buff_lisa/data/dto/group_image_dto.dart';
import 'package:buff_lisa/data/repository/group_image_repository.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_image_service.g.dart';

@Riverpod(keepAlive: true)
class GroupImageService extends _$GroupImageService {


  @override
  Future<Map<String, GroupImageDto>> build() async {
    final _groupImageRepository = ref.watch(groupImageRepositoryProvider);
    return await _groupImageRepository.fetchAllCashedImages();
  }

  Future<String?> fetchGroupImage(String groupId, bool userGroup) async {
    try {
      final _groupImageRepository = ref.watch(groupImageRepositoryProvider);
      final groupImage = await _groupImageRepository.fetchImage(groupId, userGroup);
      state.value![groupId] = groupImage;
      ref.notifyListeners();
      return null;
    } on ApiException catch (e) {
      return e.message;
    }
  }

  Future<void> deleteGroupImage(String groupId) async {
    final _groupImageRepository = ref.watch(groupImageRepositoryProvider);
    _groupImageRepository.deleteGroupImage(groupId); // run async
    return null;
  }

  Future<String?> updateGroupImage(String groupId, GroupDto groupDto) async {
    try {
      if (groupDto.profileImage == null) return null;
      final _groupImageRepository = ref.watch(groupImageRepositoryProvider);
      final imageGroupDto = await await GroupImageDto.fromGroupDto(groupDto);
      _groupImageRepository.addImage(groupId, imageGroupDto); // run async
      state.value![groupId] = imageGroupDto;
      ref.notifyListeners();
      return null;
    } on ApiException catch (e) {
      return e.message;
    }
  }


}

@riverpod
Future<GroupImageDto?> groupImageById(Ref ref, String groupId) async {
  bool containsKey = false;
  final userGroup = await ref.watch(userGroupServiceProvider.selectAsync((e) => e.any((f) => f.groupId == groupId)));
  final groupDto = await ref.watch(groupImageServiceProvider.selectAsync((u) {
    containsKey = u.containsKey(groupId);
    return containsKey ? u[groupId] : null;
  }));
  if (containsKey) {
    return groupDto;
  } else {
    await ref.read(groupImageServiceProvider.notifier).fetchGroupImage(groupId, userGroup);
    return null;
  }
}

@riverpod
Future<Uint8List?> groupProfilePictureById(Ref ref, String groupId) async {
  return await ref.watch(groupImageByIdProvider(groupId).selectAsync((e) => e?.profileImage));
}


@riverpod
Future<Uint8List?> groupProfilePictureSmallById(Ref ref, String groupId) async {
  return await ref.watch(groupImageByIdProvider(groupId).selectAsync((e) => e?.profileImageSmall));
}


@riverpod
Future<Uint8List?> groupPinImageById(Ref ref, String groupId) async {
  return await ref.watch(groupImageByIdProvider(groupId).selectAsync((e) => e?.pinImage));
}
