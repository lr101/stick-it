


import 'dart:typed_data';

import 'package:buff_lisa/data/repository/group_image_repository.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_image_service.g.dart';

@riverpod
Future<Uint8List> groupProfilePictureById(Ref ref, String groupId) async {
  final userGroup = await ref.watch(userGroupServiceProvider.selectAsync((e) => e.any((f) => f.groupId == groupId)));
  return ref.watch(groupProfileRepoProvider).fetchImage(groupId, userGroup);
}


@riverpod
Future<Uint8List> groupProfilePictureSmallById(Ref ref, String groupId) async {
  final userGroup = await ref.watch(userGroupServiceProvider.selectAsync((e) => e.any((f) => f.groupId == groupId)));
  return ref.watch(groupProfileSmallRepoProvider).fetchImage(groupId, userGroup);
}


@riverpod
Future<Uint8List> groupPinImageById(Ref ref, String groupId) async {
  final userGroup = await ref.watch(userGroupServiceProvider.selectAsync((e) => e.any((f) => f.groupId == groupId)));
  return ref.watch(groupPinImageRepoProvider).fetchImage(groupId, userGroup);
}
