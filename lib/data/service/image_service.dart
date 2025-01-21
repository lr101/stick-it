
import 'dart:typed_data';

import 'package:buff_lisa/data/repository/group_image_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_service.g.dart';

@riverpod
Future<Uint8List?> getUserProfile(Ref ref, String userId) async {
  final image = await ref.watch(userImageRepoProvider).get(userId);
  return image?.blob1;
}

@riverpod
Future<Uint8List?> getUserProfileSmall(Ref ref, String userId) async {
  final image = await ref.watch(userImageRepoProvider).get(userId);
  return image?.blob1;
}