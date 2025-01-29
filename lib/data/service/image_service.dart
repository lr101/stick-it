
import 'dart:typed_data';

import 'package:buff_lisa/data/repository/image_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_service.g.dart';

@riverpod
Future<Uint8List?> getUserProfile(Ref ref, String userId) async {
  final isUser = ref.watch(userIdProvider) == userId;
  return await ref.watch(userImageRepoProvider).fetchImage(userId, isUser);
}

@riverpod
Future<Uint8List?> getUserProfileSmall(Ref ref, String userId) async {
  final isUser = ref.watch(userIdProvider) == userId;
  return await ref.watch(userImageRepoProvider).fetchImage(userId, isUser);
}
