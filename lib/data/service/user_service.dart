import 'dart:convert';
import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/user_dto.dart';
import 'package:buff_lisa/data/repository/user_repository.dart';
import 'package:drift/drift.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/services.dart';
import 'package:collection/collection.dart';
import '../dto/global_data_dto.dart';
import 'global_data_service.dart';

part 'user_service.g.dart';

@Riverpod(keepAlive: true)
class UserService extends _$UserService {
  late UserRepository _userRepository;
  late UsersApi _usersApi;
  late AuthApi _authApi;
  late ReportApi _reportApi;
  late GlobalDataDto _data;

  @override
  Future<Map<String, LocalUserDto>> build() async {
    _userRepository = ref.watch(userRepositoryProvider);
    _data = ref.watch(globalDataServiceProvider);
    _usersApi = ref.watch(userApiProvider);
    _authApi = ref.watch(authApiProvider);
    _reportApi = ref.watch(reportApiProvider);

    final localUser = await _userRepository.getUserById(_data.userId!);
    if (_data.userId == null) return {};
    if (localUser != null) return {_data.userId!: localUser};

    final profileImage =
        await _usersApi.getUserProfileImageWithHttpInfo(_data.userId!);
    final profileImageSmall =
        await _usersApi.getUserProfileImageSmallWithHttpInfo(_data.userId!);
    return {
      _data.userId!: LocalUserDto(
          userId: _data.userId!,
          username: _data.username!,
          profileImageSmall: profileImageSmall.statusCode == 200 &&
                  profileImageSmall.bodyBytes.isNotEmpty
              ? profileImageSmall.bodyBytes
              : null,
          profileImage: profileImage.statusCode == 200 &&
                  profileImage.bodyBytes.isNotEmpty
              ? profileImage.bodyBytes
              : null)
    };
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

  Future<bool> auth(String name, String password) async {
    final response = await _authApi
        .userLogin(UserLoginRequest(username: name, password: password));
    if (response != null) {
      await ref
          .read(globalDataServiceProvider.notifier)
          .login(name, response.userId, response.refreshToken);
      return true;
    }
    return false;
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

  Future<bool> signupNewUser(String username, String hash, String email) async {
    final request =
        UserRequestDto(name: username, password: hash, email: email);
    final response = await _authApi.createUser(request);
    if (response != null) {
      final userDto = LocalUserDto(userId: response.userId, username: username);
      await _userRepository.createUser(userDto);
      await ref
          .read(globalDataServiceProvider.notifier)
          .login(username, response.userId, response.refreshToken);
      return true;
    }
    return false;
  }

  Future<String?> changeUser({String? password, String? email, Uint8List? profilePicture}) async {
    try {
      final userId = ref.watch(globalDataServiceProvider).userId!;
      final result = await _usersApi.updateUser(userId, UserUpdateDto(password: password, email: email, image: profilePicture == null ? null : base64Encode(profilePicture)));
      if (result != null && result.profileImage != null && state.value!.containsKey(userId)) {
        state.value![userId]!.profileImage = base64Decode(result.profileImage!);
        state.value![userId]!.profileImageSmall = base64Decode(result.profileImageSmall!);
        await _userRepository.createUser(state.value![userId]!);
        ref.notifyListeners();
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

  Future<bool> getDeleteCode() async {
    try {
      await _authApi.generateDeleteCode(_data.userId!);
      return true;
    } catch (e) {
      print('Error generating delete code: $e');
      return false;
    }
  }

  Future<bool> deleteAccount(int code) async {
    try {
      await _usersApi.deleteUser(_data.userId!, body: code);
      await ref.watch(globalDataServiceProvider.notifier).logout();
      return true;
    } catch (e) {
      print('Error deleting account: $e');
      return false;
    }
  }
}

@riverpod
Future<LocalUserDto> userById(UserByIdRef ref, String userId) async {
  final user = await ref.watch(userServiceProvider
      .selectAsync((u) => u.containsKey(userId) ? u[userId] : null));
  if (user != null) {
    return user;
  } else {
    return await ref.read(userServiceProvider.notifier).fetchUserById(userId);
  }
}

@riverpod
Future<Uint8List?> profilePictureById(
    ProfilePictureByIdRef ref, String userId) async {
  return await ref
      .watch(userByIdProvider(userId).selectAsync((u) => u.profileImage));
}

@riverpod
Future<Uint8List?> profilePictureSmallById(
    ProfilePictureSmallByIdRef ref, String userId) async {
  return await ref
      .watch(userByIdProvider(userId).selectAsync((u) => u.profileImageSmall));
}
