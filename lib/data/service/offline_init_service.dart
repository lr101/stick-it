

import 'package:buff_lisa/data/dto/offline_login_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offline_init_service.g.dart';

@Riverpod(keepAlive: true)
class OfflineInitService extends _$OfflineInitService {

  Set<String> loadedPinGroups = {};

  @override
  OfflineLoginDto build() {
    return OfflineLoginDto();
  }

  void setNumberOfGroup(int numberOfGroup) {
    state = state.copyWith(numberOfGroups: numberOfGroup, loadedGroups: true);
  }

  void setLoadedPinGroup(String uuid) {
    loadedPinGroups.add(uuid);
    state = state.copyWith(numberOfLoadedPinGroups: loadedPinGroups.length);
    if (loadedPinGroups.length == state.numberOfGroups) {
      state = state.copyWith(loadedPins: true);
    }
  }

  void setLoadedUser() {
    state = state.copyWith(loadedUser: true);
  }

}

