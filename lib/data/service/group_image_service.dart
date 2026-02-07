


import 'dart:typed_data';

import 'package:buff_lisa/data/repository/image_repository.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_image_service.g.dart';

@riverpod
Future<Uint8List> groupProfilePictureById(Ref ref, String groupId) async {
  final userGroup = await ref.watch(userGroupServiceProvider.selectAsync((e) => e.any((f) => f.groupId == groupId)));
  final image = await ref.watch(groupProfileRepoProvider).fetchImage(groupId, userGroup);
  if (image != null) {
    return image;
  } else {
    throw Exception("No image found for groupId: $groupId");
  }
}


@riverpod
Future<Uint8List> groupProfilePictureSmallById(Ref ref, String groupId) async {
  final userGroup = await ref.watch(userGroupServiceProvider.selectAsync((e) => e.any((f) => f.groupId == groupId)));
  final image = await  ref.watch(groupProfileSmallRepoProvider).fetchImage(groupId, userGroup);
  if (image != null) {
    return image;
  } else {
    throw Exception("No image found for groupId: $groupId");
  }
}


@riverpod
Future<Uint8List> groupPinImageById(Ref ref, String groupId) async {
  final userGroup = await ref.watch(userGroupServiceProvider.selectAsync((e) => e.any((f) => f.groupId == groupId)));
  final image = await ref.watch(groupPinImageRepoProvider).fetchImage(groupId, userGroup);
  if (image != null) {
    return image;
  } else {
    throw Exception("No image found for groupId: $groupId");
  }
}
