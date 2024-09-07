import 'dart:convert';
import 'dart:typed_data';
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/user_dto.dart';
import 'package:buff_lisa/data/repository/user_repository.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/services.dart';

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
  Future<List<LocalUserDto>> build() async {
    _userRepository = ref.watch(userRepositoryProvider);
    _data = ref.watch(globalDataServiceProvider);
    _usersApi = ref.watch(userApiProvider);
    _authApi = ref.watch(authApiProvider);
    _reportApi = ref.watch(reportApiProvider);
    return [];
  }

  // Optimized state update function for a single user
  void updateSingleUser(LocalUserDto updatedUser) {
    final currentState = state.value ?? [];
    final index = currentState.indexWhere((user) => user.userId == updatedUser.userId);

    if (index != -1) {
      final updatedState = [...currentState];
      updatedState[index] = updatedUser;
      state = AsyncValue.data(updatedState);
    }
  }

  Future<void> createUser(LocalUserDto user) async {
    try {
      await _userRepository.createUser(user);
      // Optimistically update state with the new user
      updateSingleUser(user);
    } catch (e) {
      print('Error creating user: $e');
    }
  }

  Future<LocalUserDto?> getUserById(String userId) async {
    try {
      final localUser = await _userRepository.getUserById(userId);
      if (localUser != null) return localUser;

      final remoteUser = await _usersApi.getUser(userId);
      if (remoteUser != null) {
        final userDto = LocalUserDto.fromInfoDto(remoteUser);
        await _userRepository.createUser(userDto);
        updateSingleUser(userDto);  // Update state with the fetched user
        return userDto;
      }
      return null;
    } catch (e) {
      print('Error fetching user by ID: $e');
      return null;
    }
  }

  Future<bool> auth(String name, String password) async {
    final response = await _authApi.userLogin(UserLoginRequest(username: name, password: password));
    if (response != null) {
      final userDto = LocalUserDto(userId: response.userId, username: name);
      await createUser(userDto);
      ref.read(globalDataServiceProvider.notifier).login(name, response.userId, response.refreshToken);
      return true;
    }
    return false;
  }

  Future<Uint8List> fetchProfilePicture(String userId) async {
    try {
      final user = await _userRepository.getUserById(userId);
      if (user == null) throw Exception("User not found");
      if (user.profileImage != null) return user.profileImage!;

      final profilePicture = await _usersApi.getUserProfileImageWithHttpInfo(userId);
      if (profilePicture.statusCode == 200) {
        user.profileImage = profilePicture.bodyBytes;
        _userRepository.createUser(user);
        updateSingleUser(user);  // Update state with the new profile image
        return profilePicture.bodyBytes;
      }
      return (await rootBundle.load("images/profile.jpg")).buffer.asUint8List();
    } catch (e) {
      print('Error fetching profile picture: $e');
      throw Exception("Failed to load profile picture");
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

  Future<bool> signupNewUser(String username, String hash, String email) async {
      final request = UserRequestDto(name: username, password: hash, email: email);
      final response = await _authApi.createUser(request);
      if (response != null) {
        final userDto = LocalUserDto(userId: response.userId, username: username);
        await createUser(userDto);
        ref.read(globalDataServiceProvider.notifier).login(username, response.userId, response.refreshToken);
        return true;
      }
      return false;

  }

  Future<bool> changeUser(String userId, {String? password, String? email}) async {
    try {
      await _usersApi.updateUser(userId, UserUpdateDto(password: password, email: email));
      final user = await getUserById(userId);  // Update user state with the new info
      if (user != null) updateSingleUser(user);
      return true;
    } catch (e) {
      print('Error changing user: $e');
      return false;
    }
  }

  Future<void> changeProfilePicture(String userId, Uint8List profilePicture) async {
    try {
      final response = await _usersApi.updateUserProfileImage(userId, base64Encode(profilePicture));
      final user = await _userRepository.getUserById(userId);
      if (user != null && response != null) {
        user.profileImage = base64Decode(response.profilePicture);
        user.profileImageSmall = base64Decode(response.profilePictureSmall);
        await _userRepository.createUser(user);
        updateSingleUser(user);  // Update state with the new profile picture
      }
    } catch (e) {
      print('Error changing profile picture: $e');
    }
  }

  Future<bool> postReportUser(String reportedUsername, String reportMessage) async {
    try {
      final request = ReportDto(
        report: reportedUsername,
        userId: _data.userId!,
        message: reportMessage,
      );
      await _reportApi.createReport(request);
      return true;
    } catch (e) {
      print('Error posting user report: $e');
      return false;
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
      return true;
    } catch (e) {
      print('Error deleting account: $e');
      return false;
    }
  }
}
