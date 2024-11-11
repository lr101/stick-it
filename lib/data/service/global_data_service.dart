

import 'package:buff_lisa/data/entity/database.dart';
import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/service/shared_preferences_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
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
    state.username = username;
    state.userId = userId;
    ref.notifyListeners();
  }

  Future<void> logout() async {
    await ref.watch(sharedPreferencesProvider).clear();
    await ref.watch(flutterSecureStorageProvider).deleteAll();
    await ref.watch(databaseProvider).deleteEverything();
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

  void clear() {
    state = null;
    ref.watch(sharedPreferencesProvider).remove(key);
  }

}

@riverpod
LatLng lastKnownLocation(Ref ref) {
  final lat = ref.watch(sharedPreferencesProvider).getDouble(GlobalDataRepository.lastKnownLat);
  final lng = ref.watch(sharedPreferencesProvider).getDouble(GlobalDataRepository.lastKnownLong);
  if (lat == null || lng == null) return LatLng(49.01105, 8.25190);
  return LatLng(lat, lng);
}