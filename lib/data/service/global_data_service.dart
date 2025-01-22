

import 'dart:typed_data';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/current_user_dto.dart';
import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/service/shared_preferences_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/global_data_dto.dart';

part 'global_data_service.g.dart';

@Riverpod(keepAlive: true)
class GlobalDataService  extends _$GlobalDataService {

  @override
  GlobalDataDto build() => ref.watch(globalDataOnceProvider);

  Future<void> logout() async {
    await ref.watch(flutterSecureStorageProvider).deleteAll();
    state = GlobalDataDto(userId: null, refreshToken: null, cameras: state.cameras);
  }

  Future<void> updateData(TokenResponseDto refreshToken) async {
    state = state.copyWith(refreshToken: refreshToken.refreshToken, userId: refreshToken.userId);
    await ref.read(userServiceProvider(refreshToken.userId).notifier).updateRemote();
  }

}

@riverpod
class AuthService extends _$AuthService {

  @override
  FutureOr<bool> build() async {
    return true;
  }

  Future<String?> login(String name, String password) async {
    final authApi = ref.read(authApiProvider);
    final global = ref.read(globalDataServiceProvider.notifier);
    try {
      final response = await authApi.userLogin(UserLoginRequest(username: name, password: password));
      if (response != null) {
        await ref.watch(globalDataRepositoryProvider).login(name, response.userId, response.refreshToken);
        await global.updateData(response);
      }
      return "Something unexpected happened";
    } on ApiException catch (e) {
      return e.message == null || e.message!.isEmpty
          ? "Something unexpected happened"
          : e.message;
    }
  }

  Future<bool> recover(String? name) async {
    final authApi = ref.read(authApiProvider);
    try {
      await authApi.requestPasswordRecovery(name!);
      return true;
    } catch (e) {
      if (kDebugMode) print('Error during password recovery: $e');
      return false;
    }
  }

  Future<String?> signupNewUser(String username, String password, String email) async {
    final authApi = ref.read(authApiProvider);
    final global = ref.read(globalDataServiceProvider.notifier);
    try {
      final request = UserRequestDto(name: username, password: password, email: email);
      final response = await authApi.createUser(request);
      if (response != null) {
        await global.updateData(response);
        return null;
      } else {
        return "Something unexpected happened";
      }
    } on ApiException catch (e) {
      return e.message;
    }
  }

  Future<String?> report(String reportedReferences, String reportMessage) async {
    final reportApi = ref.watch(reportApiProvider);
    final userId = ref.read(userIdProvider);
    try {
      final request = ReportDto(
        report: reportedReferences,
        userId: userId,
        message: reportMessage,
      );
      await reportApi.createReport(request);
      return null;
    } on ApiException catch (e) {
      return e.message;
    }
  }

  Future<String?> getDeleteCode() async {
    final authApi = ref.read(authApiProvider);
    try {
      final username = await ref.read(userServiceProvider(ref.read(userIdProvider)).future);
      await authApi.generateDeleteCode(username.username);
      return null;
    } on ApiException catch (e) {
      return e.message;
    }
  }

  Future<String?> deleteAccount(int code) async {
    final userApi = ref.watch(userApiProvider);
    final userId = ref.read(userIdProvider);
    final global = ref.read(globalDataServiceProvider.notifier);
    try {
      await userApi.deleteUser(userId, body: code);
      await global.logout();
      return null;
    } on ApiException catch (e) {
      if(kDebugMode) print('Error deleting account: $e');
      return e.message;
    }
  }
}

@riverpod
String userId(Ref ref) => ref.watch(globalDataServiceProvider).userId!;

@riverpod
class CameraTorch extends _$CameraTorch {

  @override
  bool build() {
    return ref.watch(sharedPreferencesProvider).getBool(GlobalDataRepository.cameraTorch) ?? false;
  }


  void setTorch(bool value) {
    state = value;
    ref.watch(sharedPreferencesProvider).setBool(GlobalDataRepository.cameraTorch, value);
  }
}

@Riverpod(keepAlive: true)
class LastSeen extends _$LastSeen {

  @override
  DateTime? build(String key) {
    final lastSeen = ref.watch(sharedPreferencesProvider).getInt(key);
    if (lastSeen == null) return null;
    return DateTime.fromMicrosecondsSinceEpoch(lastSeen);
  }


  void setLastSeenNow() {
    state = DateTime.now();
    ref.watch(sharedPreferencesProvider).setInt(key, state!.microsecondsSinceEpoch);
  }


}

@riverpod
LatLng lastKnownLocation(Ref ref) {
  final lat = ref.watch(sharedPreferencesProvider).getDouble(GlobalDataRepository.lastKnownLat);
  final lng = ref.watch(sharedPreferencesProvider).getDouble(GlobalDataRepository.lastKnownLong);
  if (lat == null || lng == null) return LatLng(49.01105, 8.25190);
  return LatLng(lat, lng);
}
