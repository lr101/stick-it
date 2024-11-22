import 'dart:convert';
import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/service/user_image_service.dart';
import 'package:buff_lisa/data/service/user_image_service_small.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/services.dart';
import 'package:collection/collection.dart';
import '../dto/global_data_dto.dart';
import '../dto/local_user_dto.dart';
import 'global_data_service.dart';

part 'user_service.g.dart';

@Riverpod(keepAlive: true)
class UserService extends _$UserService {
  late UsersApi _usersApi;
  late AuthApi _authApi;
  late ReportApi _reportApi;
  late GlobalDataDto _data;

  @override
  Future<Map<String, LocalUserDto>> build() async {
    _data = ref.watch(globalDataServiceProvider);
    _usersApi = ref.watch(userApiProvider);
    _authApi = ref.watch(authApiProvider);
    _reportApi = ref.watch(reportApiProvider);
    if (_data.userId == null) return {};
    return {_data.userId!: ref.watch(currentUserServiceProvider).toLocalUser(_data.userId!)};
  }

  Future<LocalUserDto> fetchUserById(String userId) async {
    final user = await _usersApi.getUser(userId);
    if (user != null) {
      final map = {...state.value ?? {}};
      map[userId] = LocalUserDto.fromInfoDto(user);
      state = AsyncData(map);
      return map[userId]!;
    } else {
      throw Exception("User not found");
    }
  }

  Future<String?> auth(String name, String password) async {
    try {
      final response = await _authApi.userLogin(UserLoginRequest(username: name, password: password));
      if (response != null) {
        await ref
            .read(globalDataServiceProvider.notifier)
            .login(name, response.userId, response.refreshToken);
        return null;
      }
      return "Something unexpected happened";
    } on ApiException catch (e) {
      return e.message == null || e.message!.isEmpty ? "Something unexpected happened": e.message;
    }
  }

  Future<bool> recover(String? name) async {
    try {
      await _authApi.requestPasswordRecovery(name!);
      return true;
    } catch (e) {
      print('Error during password recovery: $e');
      return false;
    }
  }

  Future<String?> signupNewUser(
      String username, String password, String email) async {
    try {
      final request = UserRequestDto(name: username, password: password, email: email);
      final response = await _authApi.createUser(request);
      if (response != null) {
        await ref.read(globalDataServiceProvider.notifier).login(username, response.userId, response.refreshToken);
        return null;
      } else {
        return "Something unexpected happened";
      }
    } on ApiException catch (e) {
      return e.message;
    }
  }

  Future<String?> changeUser(
      {String? password, String? email, Uint8List? profilePicture, String? description, String? username}) async {
    try {
      final global = ref.watch(globalDataServiceProvider);
      final userId = global.userId!;
      final result = await _usersApi.updateUser(
          userId,
          UserUpdateDto(
              password: password,
              email: email,
              description: description,
              username: username,
              image: profilePicture == null
                  ? null
                  : base64Encode(profilePicture)));
      if (result != null) {
        ref.read(userImageServiceSmallProvider.notifier).fetchUserImage(userId, signedUrl: result.profileImageSmall);
        ref.read(userImageServiceProvider.notifier).fetchUserImage(userId, signedUrl: result.profileImage);
        ref.read(currentUserServiceProvider.notifier).update(username: result.username, description: result.description);
      }
      return null;
    } on ApiException catch (e) {
      return e.message!;
    }
  }

  Future<String?> report(
      String reportedReferences, String reportMessage) async {
    try {
      final request = ReportDto(
        report: reportedReferences,
        userId: _data.userId!,
        message: reportMessage,
      );
      await _reportApi.createReport(request);
      return null;
    } on ApiException catch (e) {
      return e.message;
    }
  }

  Future<String?> getDeleteCode() async {
    try {
      await _authApi.generateDeleteCode(ref.watch(currentUserServiceProvider).username!);
      return null;
    } on ApiException catch (e) {
      return e.message;
    }
  }

  Future<String?> deleteAccount(int code) async {
    try {
      await _usersApi.deleteUser(_data.userId!, body: code);
      await ref.watch(globalDataServiceProvider.notifier).logout();
      return null;
    } on ApiException catch (e) {
      print('Error deleting account: $e');
      return e.message;
    }
  }
}

@riverpod
Future<LocalUserDto> userById(Ref ref, String userId) async {
  final user = await ref.watch(userServiceProvider
      .selectAsync((u) => u.containsKey(userId) ? u[userId] : null));
  if (user != null) {
    return user;
  } else {
    return await ref.read(userServiceProvider.notifier).fetchUserById(userId);
  }
}

