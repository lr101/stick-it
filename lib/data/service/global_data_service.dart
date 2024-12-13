

import 'dart:typed_data';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/dto/current_user_dto.dart';
import 'package:buff_lisa/data/entity/database.dart';
import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/service/shared_preferences_service.dart';
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

  Future<void> login(String username, String userId, String token) async {
    await ref.watch(globalDataRepositoryProvider).login(username, userId, token);
    state.refreshToken = token;
    state.userId = userId;
    ref.notifyListeners();
    await ref.read(currentUserServiceProvider.notifier).updateFromRemote();
  }

  Future<void> logout() async {
    await ref.watch(flutterSecureStorageProvider).deleteAll();
  }



}


@Riverpod(keepAlive: true)
class CurrentUserService extends _$CurrentUserService {

  @override
  CurrentUserDto build() => ref.watch(currentUserOnceProvider);

  Future<void> updateFromRemote() async {
    state = await  GlobalDataRepository.getUser(ref.watch(sharedPreferencesProvider), ref.watch(flutterSecureStorageProvider));
    final userId = ref.watch(globalDataServiceProvider).userId!;
    final user = await ref.watch(userApiProvider).getUser(userId);
    if (user == null) return;
    await update(username: user.username, description: user.description);
    await runXpUpdate();
  }

  Future<void> update({String? description, String? username, Uint8List? profileImage, Uint8List? profileImageSmall, int? selectedBatch}) async {
    state = CurrentUserDto(
        username: username ?? state.username,
        description: description ?? state.description,
        profileImage: profileImage ?? state.profileImage,
        profileImageSmall: profileImageSmall ?? state.profileImageSmall,
      selectedBatch: selectedBatch ?? state.selectedBatch,
     xp: state.xp);
    await ref.read(globalDataRepositoryProvider).updateCurrentUser(description: description, username: username, profileImage: profileImage, profileImageSmall: profileImageSmall, selectedBatch: selectedBatch);
  }

  Future<void> runXpUpdate() async {
    final global = await ref.watch(globalDataServiceProvider);
    final xp = await ref.watch(userApiProvider).getUserXp(global.userId!);
    ref.read(globalDataRepositoryProvider).setXp(xp!);
    state = CurrentUserDto(
        username: state.username,
        description: state.description,
        profileImage: state.profileImage,
        profileImageSmall: state.profileImageSmall,
        selectedBatch: state.selectedBatch,
        xp: xp
    );
  }

}

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

@riverpod
UserXpDto xp(Ref ref) {
  return ref.watch(currentUserServiceProvider.select((e) => e.xp));
}