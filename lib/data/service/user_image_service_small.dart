
import 'dart:typed_data';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'global_data_service.dart';
import 'package:http/http.dart' as http;

part 'user_image_service_small.g.dart';

@Riverpod(keepAlive: true)
class UserImageServiceSmall extends _$UserImageServiceSmall {

  @override
  Future<Map<String, Uint8List?>> build() async {
    final global = ref.watch(globalDataServiceProvider);
    final profileImage = await http.get(Uri.parse("${global.minioHost}/users/${global.userId}/profile_small.png"));
    if (profileImage.statusCode == 200) {
      return {global.userId!: profileImage.bodyBytes};
    } else {
      return {global.userId!: null};
    }
  }

  Future<String?> fetchUserImage(String userId, {String? signedUrl}) async {
    try {
      final global = ref.watch(globalDataServiceProvider);
      final profileImage = await http.get(Uri.parse(signedUrl != null ? signedUrl : "${global.minioHost}/users/${userId}/profile_small.png"));
      if (profileImage.statusCode == 200) {
        state.value![userId] = profileImage.bodyBytes;
        ref.notifyListeners();
        return null;
      } else {
        state.value![userId] = null;
      }
      ref.notifyListeners();
      return null;
    } on ApiException catch (e) {
      return e.message;
    }
  }

  void updateUserImage(String userId, Uint8List image) {
    state.value![userId] = image;
    ref.notifyListeners();
  }
}

@riverpod
Future<Uint8List?> userProfilePictureSmallById(Ref ref, String userId) async {
  bool containsKey = false;
  final profilePicture = await ref.watch(userImageServiceSmallProvider.selectAsync((u) {
    containsKey = u.containsKey(userId);
    return containsKey ? u[userId] : null;
  }));
  if (containsKey) {
    return profilePicture;
  } else {
    await ref.read(userImageServiceSmallProvider.notifier).fetchUserImage(userId);
    return null;
  }
}
