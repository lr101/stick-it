

import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/service/shared_preferences_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/global_data_dto.dart';

part 'global_data_service.g.dart';

@Riverpod(keepAlive: true)
class GlobalDataService  extends _$GlobalDataService {

  @override
  GlobalDataDto build() => ref.watch(globalDataOnceProvider);

  Future<void> setMapStyle(int value) async {
    await ref.watch(globalDataRepositoryProvider).setMapStyle(value);
    state.mapStyle = value;
    ref.notifyListeners();
  }

  Future<void> setLastSeen() async {
    await ref.watch(globalDataRepositoryProvider).setLastSeenNow();
    state.lastSeen = DateTime.now();
    ref.notifyListeners();
  }

  Future<void> setGroupOrder(List<String> order) async {
    await ref.watch(globalDataRepositoryProvider).setGroupOrder(order);
    state.groupOrder = order;
    ref.notifyListeners();
  }

  Future<void> login(String username, String userId, String token) async {
    await ref.watch(globalDataRepositoryProvider).login(username, userId, token);
    state.refreshToken = token;
    state.username = username;
    state.userId = userId;
  }

  Future<void> logout() async {
    await ref.watch(globalDataRepositoryProvider).logout();
    state = await GlobalDataRepository.get(
      ref.watch(sharedPreferencesProvider),
      ref.watch(flutterSecureStorageProvider)
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