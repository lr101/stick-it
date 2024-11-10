
import 'dart:typed_data';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'global_data_service.dart';
import 'package:http/http.dart' as http;

part 'user_image_service.g.dart';

@Riverpod(keepAlive: true)
class UserImageService extends _$UserImageService {

  @override
  Future<Map<String, Uint8List?>> build() async {
    final _data = ref.watch(globalDataServiceProvider);
    final _usersApi = ref.watch(userApiProvider);
    final profileImageUrl = await _usersApi.getUserProfileImage(_data.userId!);
    if (profileImageUrl != null) {
      final profileImage = await http.get(Uri.parse(profileImageUrl));
      return {_data.userId!: profileImage.bodyBytes};
    } else {
      return {_data.userId!: null};
    }
  }

  Future<String?> fetchUserImage(String userId) async {
    try {
      final _usersApi = ref.watch(userApiProvider);
      final profileImageUrl = await _usersApi.getUserProfileImage(userId);
      if (profileImageUrl != null) {
        final profileImage = await http.get(Uri.parse(profileImageUrl));
        state.value![userId] = profileImage.bodyBytes;
        ref.notifyListeners();
        return null;
      } else {
        return 'Failed to fetch profile image';
      }
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
Future<Uint8List?> profilePictureById(Ref ref, String userId) async {
  bool containsKey = false;
  final profilePicture = await ref.watch(userImageServiceProvider.selectAsync((u) {
    containsKey = u.containsKey(userId);
    return containsKey ? u[userId] : null;
  }));
  if (containsKey) {
    return profilePicture;
  } else {
    await ref.read(userImageServiceProvider.notifier).fetchUserImage(userId);
    return null;
  }
}
