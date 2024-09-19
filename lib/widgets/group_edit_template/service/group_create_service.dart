
import 'dart:typed_data';

import 'package:buff_lisa/data/dto/group_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_create_service.g.dart';

class GroupCreateState {

  GroupCreateState({
    this.visibility = 0,
    this.profileImage,
  });

  int visibility;
  Uint8List? profileImage;


  factory GroupCreateState.fromLocalGroupDto(LocalGroupDto localGroupDto) {
    return GroupCreateState(
      visibility: localGroupDto.visibility,
      profileImage: localGroupDto.profileImage
    );
  }


}

@riverpod
class GroupCreateService extends _$GroupCreateService {


  @override
  GroupCreateState build() =>  GroupCreateState();

  void init(LocalGroupDto localGroupDto) {
    state = GroupCreateState.fromLocalGroupDto(localGroupDto);
  }

  void updateProfileImage(Uint8List profileImage) {
    state.profileImage = profileImage;
    ref.notifyListeners();
  }

  void updateVisibility(int visibility) {
    state.visibility = visibility;
    ref.notifyListeners();
  }

}


@riverpod
Uint8List? createGroupProfileImage(CreateGroupProfileImageRef ref) {
  return ref.watch(groupCreateServiceProvider.select((e) => e.profileImage));
}